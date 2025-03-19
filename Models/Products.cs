using System.ComponentModel.DataAnnotations.Schema;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace WebApiProducts.Models
{
    public class Products
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string? Image { get; set; }
        public int Rate { get; set; }
        [Column(TypeName = "decimal(10,2)")]
        public double Price { get; set; }
        public int CategoryId { get; set; }
        public virtual Category Category { get; set; }

        private static int Idx = 0;

        public Products()
        {

        }
        public Products(int id, string title, string description, string? image, int rate, double price, int categoryId, Category category)
        {
            Id = id;
            Title = title;
            Description = description;
            Image = image;
            Rate = rate;
            Price = price;
            CategoryId = categoryId;
            Category = category;
        }

        public Products AddProduct(int id, string title, double price, string description, string image, int rate, int category)
        {
            id = id + 1;
            Products products = new Products
            {
                Id = id,
                Title = title,
                Description = description,
                Image = image,
                Rate = rate,
                Price = price,
                CategoryId = category,
            };
            return products;
        }
    }
}
