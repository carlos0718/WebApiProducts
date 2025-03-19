namespace WebApiProducts.Services
{
    public interface ICacheService
    {
        Task SetCacheValueAsync(string key, string value);
        Task<string> GetCacheValueAsync(string key);
    }
}
