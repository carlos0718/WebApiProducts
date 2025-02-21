using System.ComponentModel.DataAnnotations.Schema;

namespace WebApiProducts.Models
{
    public class Products
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string? Image { get; set; }
        public int Rate { get; set; }
        [Column(TypeName = "decimal(10,2)")]
        public double Price { get; set; }
        public int CategoryId { get; set; }
        public virtual Category Category { get; set; }
        public Products()
        {

        }

        public Products(int id, string name, double price, Category category)
        {
            Id = id;
            Name = name;
            Price = price;
            Category = category;
        }
    }
}
