use db14340
go


create table Category(
	Id int primary key identity(1,1),
	[Name] varchar(20) not null
)
go
create table Products(
	Id int primary key identity(1,1),
	[Name] varchar(50) not null,
	[Description] varchar(max),
	Rate int not null,
	Price decimal(10,2) not null,
	CategoryId int foreign key references Category(Id)
)
go
alter table Products 
add [Image] varchar(max) 
go
alter table Products 
add Title varchar(max) 
go
alter table Products
drop column [Name]

update Products set Title = [Name]

-- insert Categorias
INSERT INTO Category ([Name]) VALUES 
('Electronics'),
('Clothing'),
('Books'),
('Home & Kitchen'),
('Sports & Outdoors');

-- Insertar Productos
INSERT INTO Products ([Name], [Description], Rate, Price, CategoryId, Image) VALUES
-- Electronics
('Smartphone', 'Latest model with 128GB storage', 5, 699.99, 1, NULL),
('Laptop', '15-inch laptop with 16GB RAM', 4, 1199.99, 1, NULL),
('Smartwatch', 'Water-resistant smartwatch', 4, 199.99, 1, NULL),
('Headphones', 'Noise-canceling over-ear headphones', 5, 299.99, 1, NULL),
('Gaming Console', 'Next-gen gaming console', 5, 499.99, 1, NULL),
('Wireless Mouse', 'Ergonomic wireless mouse', 4, 49.99, 1, NULL),
('Keyboard', 'Mechanical keyboard with RGB', 5, 89.99, 1, NULL),
('Tablet', '10-inch tablet with stylus', 4, 349.99, 1, NULL),
('Bluetooth Speaker', 'Portable waterproof speaker', 4, 99.99, 1, NULL),
('Monitor', '27-inch 4K UHD monitor', 5, 399.99, 1, NULL),

-- Clothing
('Jeans', 'Slim fit blue denim jeans', 4, 49.99, 2, NULL),
('T-Shirt', 'Cotton t-shirt in various colors', 4, 19.99, 2, NULL),
('Jacket', 'Waterproof winter jacket', 5, 129.99, 2, NULL),
('Sneakers', 'Running shoes with cushioned soles', 4, 79.99, 2, NULL),
('Hoodie', 'Fleece-lined hoodie', 4, 39.99, 2, NULL),
('Formal Shirt', 'White long-sleeve formal shirt', 5, 59.99, 2, NULL),
('Dress', 'Floral summer dress', 4, 69.99, 2, NULL),
('Cap', 'Adjustable baseball cap', 4, 14.99, 2, NULL),
('Socks', 'Pack of 5 cotton socks', 5, 9.99, 2, NULL),
('Sunglasses', 'UV-protection sunglasses', 5, 89.99, 2, NULL),

-- Books
('The Alchemist', 'Best-selling novel by Paulo Coelho', 5, 14.99, 3, NULL),
('1984', 'Dystopian novel by George Orwell', 5, 12.99, 3, NULL),
('Atomic Habits', 'Self-improvement book by James Clear', 5, 19.99, 3, NULL),
('To Kill a Mockingbird', 'Classic American novel', 4, 9.99, 3, NULL),
('Harry Potter', 'Fantasy book by J.K. Rowling', 5, 29.99, 3, NULL),
('Rich Dad Poor Dad', 'Personal finance book', 4, 15.99, 3, NULL),
('The Power of Now', 'Spiritual guide by Eckhart Tolle', 4, 18.99, 3, NULL),
('The Lean Startup', 'Entrepreneurship book', 5, 24.99, 3, NULL),
('Deep Work', 'Productivity guide by Cal Newport', 5, 21.99, 3, NULL),
('The Hobbit', 'Fantasy novel by J.R.R. Tolkien', 5, 13.99, 3, NULL),

-- Home & Kitchen
('Coffee Maker', 'Automatic coffee brewing machine', 5, 79.99, 4, NULL),
('Blender', 'High-power kitchen blender', 4, 59.99, 4, NULL),
('Microwave Oven', 'Compact microwave oven', 5, 99.99, 4, NULL),
('Air Fryer', 'Oil-free air fryer for healthy cooking', 5, 119.99, 4, NULL),
('Vacuum Cleaner', 'Cordless vacuum cleaner', 4, 149.99, 4, NULL),
('Toaster', '2-slice stainless steel toaster', 4, 39.99, 4, NULL),
('Knife Set', 'Professional stainless steel knife set', 5, 89.99, 4, NULL),
('Dish Rack', 'Foldable dish drying rack', 4, 24.99, 4, NULL),
('Cookware Set', 'Non-stick cookware set', 5, 199.99, 4, NULL),
('Electric Kettle', 'Fast boiling electric kettle', 5, 34.99, 4, NULL),

-- Sports & Outdoors
('Dumbbells', 'Adjustable dumbbell set', 5, 79.99, 5, NULL),
('Treadmill', 'Electric running treadmill', 5, 599.99, 5, NULL),
('Yoga Mat', 'Non-slip yoga mat', 4, 29.99, 5, NULL),
('Basketball', 'Official size basketball', 4, 24.99, 5, NULL),
('Tent', 'Waterproof camping tent', 5, 129.99, 5, NULL),
('Bicycle', 'Mountain bike with 21-speed gears', 5, 349.99, 5, NULL),
('Backpack', 'Hiking backpack with multiple compartments', 5, 69.99, 5, NULL),
('Jump Rope', 'Adjustable fitness jump rope', 4, 14.99, 5, NULL),
('Resistance Bands', 'Set of 5 resistance bands', 4, 19.99, 5, NULL),
('Sleeping Bag', 'Cold-weather sleeping bag', 5, 79.99, 5, NULL);
