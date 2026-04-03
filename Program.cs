using Microsoft.EntityFrameworkCore;
using WebApiProducts.Models;
using StackExchange.Redis;
using WebApiProducts.Services;
using Microsoft.OpenApi.Models;


var builder = WebApplication.CreateBuilder(args);

Console.WriteLine($"Current Environment: {builder.Environment.EnvironmentName}");

// Add services to the container.
builder.Configuration.AddEnvironmentVariables();
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "WebApiProducts",
        Version = "v1",
        Description = "API para gestionar productos y categorías.",
        Contact = new OpenApiContact
        {
            Name = "Carlos Jesus",
            Url = new Uri("https://portfolio-master-carlos-jesus.vercel.app/")
        }
    });
});

// Add DB conection
var dbConnectionString = Environment.GetEnvironmentVariable("DB_CONNECTION_STRING") ?? builder.Configuration.GetConnectionString("DefaultConnection");
try
{
    builder.Services.AddDbContext<DBProductsContext>(options => options.UseSqlServer(dbConnectionString));
}
catch (Exception ex)
{
    Console.WriteLine($"Error connecting to DB: {ex.Message}");
}

// add redis connection
if (builder.Environment.IsProduction() || builder.Environment.IsStaging())
{
    var redisConnectionString = Environment.GetEnvironmentVariable("REDIS_CONNECTION_STRING");
    var redisHost = Environment.GetEnvironmentVariable("Redis_Host");//builder.Configuration["Redis:Host"];
    var redisPort = Environment.GetEnvironmentVariable("Redis_Port");//builder.Configuration.GetValue<int>("Redis:Port");
    var redisUser = Environment.GetEnvironmentVariable("Redis_User");//builder.Configuration["Redis:User"];
    var redisPassword = Environment.GetEnvironmentVariable("Redis_Password");//builder.Configuration["Redis:Password"];
    var useSsl = Environment.GetEnvironmentVariable("Redis_UseSsl")?.ToLower() == "true";

    // Construir el objeto ConfigurationOptions
    var configOptions = new ConfigurationOptions
    {
        EndPoints = { redisHost }, // Si redisHost ya incluye puerto, no agregar redisPort
        User = string.IsNullOrEmpty(redisUser) ? null : redisUser,
        Password = string.IsNullOrEmpty(redisPassword) ? null : redisPassword,
        Ssl = useSsl,
        SslHost = redisHost?.Split(':')[0], // Extraer solo el host sin puerto para SslHost
        AbortOnConnectFail = false,
        SyncTimeout = 10000,
        ConnectTimeout = 10000
    };

    try
    {
        var redisConnection = ConnectionMultiplexer.Connect(configOptions);
        builder.Services.AddSingleton<IConnectionMultiplexer>(redisConnection);
        Console.WriteLine($"Redis connected successfully to: {redisHost}");
    }
    catch (Exception ex)
    {
        builder.Services.AddSingleton<IConnectionMultiplexer>();
        Console.WriteLine($"Error connecting to Redis: {ex.Message}");
    }

}
else
{
    // Para desarrollo local, utiliza appsettings.Development.json
    var redisConnectionString = builder.Configuration["Redis:ConnectionString"];
    if (!string.IsNullOrEmpty(redisConnectionString))
    {
        try
        {
            ConfigurationOptions? options = ConfigurationOptions.Parse(redisConnectionString);
            options.Ssl = false;
            options.SyncTimeout = 5000;
            options.ConnectTimeout = 5000;
            options.AbortOnConnectFail = false;
            var redisConnection = ConnectionMultiplexer.Connect(options);
            builder.Services.AddSingleton<IConnectionMultiplexer>(redisConnection);
            Console.WriteLine($"Redis connected successfully: {redisConnectionString}");
        }
        catch (Exception ex)
        {
            builder.Services.AddSingleton<IConnectionMultiplexer>();
            Console.WriteLine($"Warning: Could not connect to Redis in Development: {ex.Message}. Continuing without cache.");
        }
    }
    else
    {
        builder.Services.AddSingleton<IConnectionMultiplexer>();
        Console.WriteLine("Redis connection string not found. Continuing without cache.");
    }
}

// add ICacheService
builder.Services.AddScoped<ICacheService, RedisCacheService>();
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll",
        builder => builder.AllowAnyOrigin()
            .AllowAnyMethod()
            .AllowAnyHeader());
});

var app = builder.Build();

// Middleware para manejo global de excepciones
app.Use(async (context, next) =>
{
    try
    {
        await next();
    }
    catch (Exception ex)
    {
        context.Response.StatusCode = StatusCodes.Status500InternalServerError;
        context.Response.ContentType = "application/json";

        // Log de excepción
        var logger = app.Services.GetRequiredService<ILogger<Program>>();
        logger.LogError(ex, "An unhandled exception occurred");

        var response = new
        {
            statusCode = StatusCodes.Status500InternalServerError,
            message = "An internal server error occurred",
            detail = ex.Message,
            stackTrace = ex.StackTrace,
            innerException = ex.InnerException?.Message
        };

        await context.Response.WriteAsJsonAsync(response);
    }
});

// Configure the HTTP request pipeline.
//if (app.Environment.IsDevelopment())
//{
//}

app.UseSwagger(c => c.OpenApiVersion = Microsoft.OpenApi.OpenApiSpecVersion.OpenApi2_0);
app.UseSwaggerUI();
app.UseHttpsRedirection();

app.UseAuthorization();
app.UseCors("AllowAll");
app.MapControllers();
app.Run();
