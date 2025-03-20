using Microsoft.EntityFrameworkCore;
using WebApiProducts.Models;
using Microsoft.Extensions.DependencyInjection;
using StackExchange.Redis;
using WebApiProducts.Services;
using Microsoft.Extensions.Options;

var builder = WebApplication.CreateBuilder(args);

Console.WriteLine($"Current Environment: {builder.Environment.EnvironmentName}");

// Add services to the container.
builder.Configuration.AddEnvironmentVariables();
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

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

    try
    {
        ConfigurationOptions? options = ConfigurationOptions.Parse(redisConnectionString);

        // Asegurarse de habilitar SSL
        options.Ssl = true; // Habilitar SSL para la conexión
        options.SslHost = "redis-13316.c239.us-east-1-2.ec2.redns.redis-cloud.com";  // Host de Redis Cloud
        options.SyncTimeout = 10000; // tiempo de espera a 10 segundos
        options.AbortOnConnectFail = false;
        var redisConnection = ConnectionMultiplexer.Connect(options);
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
        builder.Services.AddSingleton<IConnectionMultiplexer>(ConnectionMultiplexer.Connect(redisConnectionString));
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

app.UseSwagger();
app.UseSwaggerUI();
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
