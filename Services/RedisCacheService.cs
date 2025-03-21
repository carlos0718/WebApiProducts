using StackExchange.Redis;

namespace WebApiProducts.Services
{
    public class RedisCacheService : ICacheService
    {
        private readonly IConnectionMultiplexer _connectionMultiplexer;

        public RedisCacheService(IConnectionMultiplexer connectionMultiplexer)
        {
            _connectionMultiplexer = connectionMultiplexer;
        }

        public async Task<string> GetCacheValueAsync(string key)
        {
            if (_connectionMultiplexer == null || !_connectionMultiplexer.IsConnected)
            {
                // Manejar el error de conexión
                Console.WriteLine("No se pudo conectar a Redis.");
                return string.Empty;
            }

            try
            {
                var db = _connectionMultiplexer.GetDatabase();
                var value = await db.StringGetAsync(key);
                return value.HasValue ? value.ToString() : string.Empty;
            }
            catch (Exception ex)
            {
                // Manejar cualquier otro error
                Console.WriteLine($"Error al acceder a Redis: {ex.Message}");
                return string.Empty;
            }
        }

        public async Task SetCacheValueAsync(string key, string value)
        {
            var db = _connectionMultiplexer.GetDatabase();
            await db.StringSetAsync(key, value, TimeSpan.FromHours(2));
        }
    }
}
