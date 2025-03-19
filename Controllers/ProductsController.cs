using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApiProducts.Models;
using WebApiProducts.Services;
using Newtonsoft.Json;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.Http.HttpResults;

namespace WebApiProducts.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly DBProductsContext _context;
        private readonly ICacheService _cacheService;
        public ProductsController(DBProductsContext context, ICacheService cacheService)
        {
            _context = context;
            _cacheService = cacheService;
        }

        // GET: api/Products
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Products>>> GetProducts()
        {
            string? cacheKey = "Products";
            List<Products>? prodList = new List<Products>();
            var cachingData = await _cacheService.GetCacheValueAsync(cacheKey);
            if (string.IsNullOrEmpty(cachingData))
            {
                prodList = await _context.Products.ToListAsync();
                await _cacheService.SetCacheValueAsync(cacheKey, JsonConvert.SerializeObject(prodList));
                return Ok(prodList);
            }
            prodList = JsonConvert.DeserializeObject<List<Products>>(cachingData);

            if (prodList == null)
                return NotFound();

            return prodList;
        }

        // GET: api/Products/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Products>> GetProducts(int id)
        {
            string cacheKey = "Product_Id_" + id;
            var cachingData = await _cacheService.GetCacheValueAsync(cacheKey);
            Products? product;
            if (string.IsNullOrEmpty(cachingData))
            {
                product = await _context.Products.FindAsync(id);
                if (product == null)
                {
                    return NotFound();
                }
                await _cacheService.SetCacheValueAsync(cacheKey, JsonConvert.SerializeObject(product));
                return product;
            }
            product = JsonConvert.DeserializeObject<Products>(cachingData);
            if (product == null)
                return NotFound();
            return product;
        }

        // PUT: api/Products/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProducts(int id, Products products)
        {
            if (id != products.Id)
            {
                return BadRequest();
            }

            _context.Entry(products).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductsExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Products
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Products>> PostProducts(Products products)
        {
            //_context.Products.Add(products);
            //await _context.SaveChangesAsync();
            string cacheKey = "Products";
            string cachingProdList = await _cacheService.GetCacheValueAsync(cacheKey);
            List<Products>? productsList;
            if (string.IsNullOrEmpty(cachingProdList))
                productsList = await _context.Products.ToListAsync();
            else
                productsList = JsonConvert.DeserializeObject<List<Products>>(cachingProdList);

            int id = productsList.Count;
            Products newProd = new Products();
            newProd = newProd.AddProduct(id, products.Title, products.Price, products.Description, products.Image, products.Rate, products.CategoryId);

            productsList?.Add(newProd);

            await _cacheService.SetCacheValueAsync(cacheKey, JsonConvert.SerializeObject(productsList));

            return Ok("Object added to DB temporal");
        }

        // DELETE: api/Products/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProducts(int id)
        {
            var products = await _context.Products.FindAsync(id);
            if (products == null)
            {
                return NotFound();
            }

            _context.Products.Remove(products);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ProductsExists(int id)
        {
            return _context.Products.Any(e => e.Id == id);
        }
    }
}
