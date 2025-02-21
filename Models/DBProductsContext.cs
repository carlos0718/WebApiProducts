using Microsoft.EntityFrameworkCore;

namespace WebApiProducts.Models
{
    public class DBProductsContext : DbContext
    {
        public DBProductsContext(DbContextOptions<DBProductsContext> options) : base(options)
        {

        }

        public DbSet<Products> Products { get; set; }
        public DbSet<Category> Category { get; set; }
    }
}
