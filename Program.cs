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
builder.Services.AddDbContext<DBProductsContext>(options =>
options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// add redis connection
try
{
    var connection = ConnectionMultiplexer.Connect(builder.Configuration["Redis:ConnectionString"]);
    builder.Services.AddSingleton<IConnectionMultiplexer>(connection);
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
