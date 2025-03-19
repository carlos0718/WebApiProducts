using Microsoft.EntityFrameworkCore;
using WebApiProducts.Models;
using Microsoft.Extensions.DependencyInjection;
using StackExchange.Redis;
using WebApiProducts.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Add DB conection
var dbConnectionString = Environment.GetEnvironmentVariable("DB_CONNECTION_STRING") ?? builder.Configuration.GetConnectionString("dbConnectionString");
try
{
    builder.Services.AddDbContext<DBProductsContext>(options => options.UseSqlServer(dbConnectionString));
}
catch (Exception ex)
{
    Console.WriteLine($"Error connecting to DB: {ex.Message}");
}

// add redis connection
var redisConnectionString = Environment.GetEnvironmentVariable("REDIS_CONNECTION_STRING") ?? builder.Configuration["Redis:ConnectionString"];

try
{
    ConfigurationOptions? options = ConfigurationOptions.Parse(redisConnectionString);

    // Asegurarse de habilitar SSL
    options.Ssl = true; // Habilitar SSL para la conexión
    options.SslHost = "redis-13316.c239.us-east-1-2.ec2.redns.redis-cloud.com:13316";  // Host de Redis Cloud
    options.AbortOnConnectFail = false;
    var redisConnection = ConnectionMultiplexer.Connect(options);
    builder.Services.AddSingleton<IConnectionMultiplexer>(redisConnection);
}
catch (Exception ex)
{
    builder.Services.AddSingleton<IConnectionMultiplexer>();
    Console.WriteLine($"Error connecting to Redis: {ex.Message}");
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
