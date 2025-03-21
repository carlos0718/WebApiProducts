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
        Version = "v1"
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
        EndPoints = { $"{redisHost}:{redisPort}" },
        User = redisUser,
        Password = redisPassword,
        Ssl = useSsl,
        SslHost = redisHost,
        AbortOnConnectFail = false,
        SyncTimeout = 10000 // Ajusta el tiempo de espera si lo deseas
    };

    try
    {
        var redisConnection = ConnectionMultiplexer.Connect(configOptions);
        builder.Services.AddSingleton<IConnectionMultiplexer>(redisConnection);
        Console.WriteLine($"Redis Connection String: {redisConnectionString}");
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
        ConfigurationOptions? options = ConfigurationOptions.Parse(redisConnectionString);
        options.Ssl = false; // Habilitar SSL
        options.SyncTimeout = 10000; // Ajusta el tiempo de espera si es necesario
        options.AbortOnConnectFail = false; // No abortar si la conexión falla
        builder.Services.AddSingleton<IConnectionMultiplexer>(ConnectionMultiplexer.Connect(options));
        Console.WriteLine($"Redis Connection String: {builder.Configuration["Redis:ConnectionString"]}");
    }
    else
    {
        builder.Services.AddSingleton<IConnectionMultiplexer>();
        Console.WriteLine("Redis connection string not found!!.");
    }
}

// add ICacheService
builder.Services.AddScoped<ICacheService, RedisCacheService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
//if (app.Environment.IsDevelopment())
//{
//}

app.UseSwagger(c => c.OpenApiVersion = Microsoft.OpenApi.OpenApiSpecVersion.OpenApi2_0);
app.UseSwaggerUI();
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
