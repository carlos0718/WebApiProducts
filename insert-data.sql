
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Electronics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Clothing')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Sports')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Home & Kitchen')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Sports & Outdoors')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (1, N'model with 128GB storage', 5, CAST(699.99 AS Decimal(10, 2)), 1, N'https://asset.cloudinary.com/dwb12csfd/8b3af8e154dff473733fedf8dc446819', N'Iphone 14 Pro')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (2, N'Macbook Air 2022 color gray with 16GB RAM', 4, CAST(1199.99 AS Decimal(10, 2)), 1, N'https://asset.cloudinary.com/dwb12csfd/6f6cc15b9c565fc53fa78d0d1d5b3ef6', N'Macbook Air 2022')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (3, N'Xiaomi Smart Watch BT Blood Oxygen Monitor 1.83 inch LCD Screen 12 Days Battery Life', 4, CAST(199.99 AS Decimal(10, 2)), 1, N'https://asset.cloudinary.com/dwb12csfd/eeafed81d6d70fdb5b25225ab0734160', N'Redmi Watch 3')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (4, N'Wireless Headphones Over Ear, Active Noise Cancelling, Transparency Mode, Spatial Audio, Dolby Atmos, Bluetooth Headphones for iPhone, Light Blue', 5, CAST(299.99 AS Decimal(10, 2)), 1, N'https://asset.cloudinary.com/dwb12csfd/9ab7ee7b95071e96798f2ee9b8fbcabb', N'Apple AirPods Max')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (5, N'Sony PlayStation 5 Pro PlayStation 5 Pro 1000046552 2TB color blanco 2024', 5, CAST(499.99 AS Decimal(10, 2)), 1, N'https://asset.cloudinary.com/dwb12csfd/6ab2e2935e8076baef23d6bb156a075a', N'PS 5 Console')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (6, N'Mouse Logitech Master Series Mx Master 3s Graphite Color Grafito', 4, CAST(49.99 AS Decimal(10, 2)), 1, N'https://asset.cloudinary.com/dwb12csfd/753f536c33eb025bd9a0f150edd5467f', N'Wireless Mouse Logitech')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (7, N'Teclado Mecánico Redragon Fidd K683 Color Blanco Naranja Negro Led Rgb Switches Magneticos 8khz Polling Rate 60% Usb', 5, CAST(89.99 AS Decimal(10, 2)), 1, N'https://asset.cloudinary.com/dwb12csfd/ad694cc05a78f4035e0da4deca5b0d3d', N'Redragon Keyboard gamer')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (8, N'Apple iPad (9ª generación) 10.2" Wi-Fi 256GB - Gris espacial ', 4, CAST(349.99 AS Decimal(10, 2)), 1, N'https://asset.cloudinary.com/dwb12csfd/e68b87938bba843188d1931a69747640', N'Apple iPad 2024 256 GB')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (9, N'Auriculares gamer Redragon Gamer Zeus X H510-RGB negro con luz LED SENSIBILIDAD: -42 dB+/-3 dB.
RETROILUMINACIÓN: Si, retroiluminado RGB.
TIPO DE CABLE: 2 m. mallado con controles integrados.
CONECTORES: USB enchapado con filtro para interferencias.', 4, CAST(99.99 AS Decimal(10, 2)), 1, N'https://asset.cloudinary.com/dwb12csfd/11fbb18d675c3656706334b0166e6b45', N'Auriculares gamer Redragon Gamer Zeus')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (10, N'Monitor Inteligente Para Juegos Odyssey Neo G7 4k 144hz 43'''' Color Negro. Resolución de 3840 x 2160', 5, CAST(399.99 AS Decimal(10, 2)), 1, N'https://asset.cloudinary.com/dwb12csfd/98733937482a597433e5e59bbd5d061c', N'Monitor Odyssey Neo G7 4k 144hz 43''''')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (11, N'Este modelo cuenta con cuatro amplios bolsillos. Su diseño atemporal asegura que se mantenga relevante en tu guardarropa durante mucho tiempo.

El Jean Chupin de Blue Air Jeans es ideal para adultos y jóvenes que valoran la calidad y el estilo en su vestimenta.', 4, CAST(49.99 AS Decimal(10, 2)), 2, N'https://asset.cloudinary.com/dwb12csfd/d7e166a1ff03dbe8e8bb934a83989e62', N'Jean Chupin Hombre')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (12, N'Remera Oversize Unisex 100% Algodon Calidad Premium peinado 24.1, La mejor tela para la fabricación de remeras.
El talle M equivale a un talle S-M Oversize', 4, CAST(19.99 AS Decimal(10, 2)), 2, N'https://asset.cloudinary.com/dwb12csfd/b212fee16e43b31d30c018b93206cf04', N'Remera oversize')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (13, N'Campera Ecocuero Universitaria Roja para mujer impermeable.', 5, CAST(129.99 AS Decimal(10, 2)), 2, N'https://asset.cloudinary.com/dwb12csfd/94ea9a4e46f25ccdc15c0ab61c2d0c64', N'Campera Ecocuero Universitaria Roja')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (14, N'Zapatilla New Balance Mujer Fresh Foam Evoz V3 Running. Fresh Foam X EVOZ v3 es una solución versátil para correr todos los días, diseñada para una pisada suave y tranquila.', 4, CAST(79.99 AS Decimal(10, 2)), 2, N'https://asset.cloudinary.com/dwb12csfd/dd35891602e72ab81d2344660c281b97', N'Zapatilla New Balance Runing Mujer Wevozrk3')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (15, N'Buzo Puma Play Loud Classics Mostaza Solo Urbano. Logo PUMA aplicado.
Capucha con cordón de ajuste.
Puños y cintura elastizados.
RELAXED FIT: Corte suelto.
Bolsillo canguro.
Sin frisa.
Material 100% Algodón. Origen China.', 4, CAST(39.99 AS Decimal(10, 2)), 2, N'https://asset.cloudinary.com/dwb12csfd/7085c183686b4b757d15a76c85767b05', N'Buzo Puma Play Loud Classics')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (16, N'REMERA T-SHIRT BASIC II WILSON - GIRL

Interlock Microfibra // 100% Poliester
Remera basica cuello redondo en ribb al tono, tela importada que repele la humedad y transpiración.', 5, CAST(59.99 AS Decimal(10, 2)), 2, N'https://asset.cloudinary.com/dwb12csfd/27a844dd52975d295b355e995b9964ff', N'Remera Wilson Basica Deportiva Niña Junior')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (17, N'In Paradise Long es un vestido largo de fibrana estampada que te envuelve en un estilo fresco y sofisticado. Con una espalda escotada y breteles regulables cruzados, este diseño le aporta un toque sensual sin perder comodidad. El tajo lateral agrega movimiento y un aire seductor, mientras que la chapita de marca en la espalda le da un detalle distintivo.', 4, CAST(69.99 AS Decimal(10, 2)), 2, N'https://asset.cloudinary.com/dwb12csfd/0fa78b5be3d2238932e49e28e68b13bc', N'Vestido Largo Mujer Billabong In Paradise')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (18, N'New Era MLB Khaki Core Classic 9TWENTY Adjustable Hat Cap..', 4, CAST(14.99 AS Decimal(10, 2)), 2, N'https://asset.cloudinary.com/dwb12csfd/fa269f56a7a04c82bcc98f7dbac51042', N'Gorra Ajustable New Era')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (19, N'Pack x3 pares de medias media caña Puma Originales.', 5, CAST(9.99 AS Decimal(10, 2)), 2, N'https://asset.cloudinary.com/dwb12csfd/642aad38994e6301cf7e46b649900b43', N'Pack X3 Medias Puma Lifestyle Sock')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (20, N'Presentamos el modelo RB3530, un nuevo aspecto fresco que está listo para los negocios. Sus monturas cuentan con un moderno diseño cuadrado de gafas de sol con marcos cuadrados de doble puente. Fabricadas con fibra de metal y nailon, estas gafas de sol ofrecen un atractivo masculino innovador.', 5, CAST(89.99 AS Decimal(10, 2)), 2, N'https://asset.cloudinary.com/dwb12csfd/4f51af897e3e47e977878ab2f99d3991', N'Ray-ban Rb3647n Gafas Redondas Con Kit Ews')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (21, N'Conjunto Deportivo para Mujer - Marca Mikra.Modelo: Conjunto deportivo
- Material principal: Lycra importada
- Diseño de la tela: Lisa, para un look limpio y moderno
- Género: Mujer
- Cantidad de piezas: 1 conjunto (top y short)', 5, CAST(14.99 AS Decimal(10, 2)), 3, N'https://asset.cloudinary.com/dwb12csfd/e5e46ccf93c4e34cb17075f2e6f83c21', N'Conjunto Deportivo Mujer Lycra 2 Piezas')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (22, N'Este conjunto deportivo Alfest es ideal para los que buscan comodidad y estilo clasico al practicar deportes como fútbol, running o básquet. Confeccionado en poliéster de alta calidad, el conjunto incluye una remera y un short deportivo.', 5, CAST(12.99 AS Decimal(10, 2)), 3, N'https://asset.cloudinary.com/dwb12csfd/94b14e57aea8cbab06008bb84c412061', N'Conjunto Alfest Remera + Short Deportivo')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (23, N'Corré un poco más rápido. Corré un poco más lejos. Estas zapatillas de running adidas ofrecen ligereza, suavidad y sujeción para que puedas dar el siguiente paso en tu carrera', 5, CAST(19.99 AS Decimal(10, 2)), 3, N'https://asset.cloudinary.com/dwb12csfd/1bffbe7a93057dd7bb4c08ba692e0b99', N'Zapatillas Duramo Rc adidas Sport 78')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (24, N'La tecnología Nike DriFIT absorbe la transpiración de la piel para acelerar la evaporación, lo que ayuda a mantener la transpirabilidad y la comodidad.
El tejido Knit elástico levemente texturizado es ligero y transpirable', 4, CAST(9.99 AS Decimal(10, 2)), 3, N'https://asset.cloudinary.com/dwb12csfd/b15fe7f8afb150182e192681bd48d6f5', N'Remera Hombre Nike Strike Playera De Fútbol')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (25, N'Conjunto Buzo y Joggings Chupin GDO take it easy con bolsillos de poliester

CARACTERÍSTICAS:
Confeccionadas con poliester de primera calidad
Ideales para uso diario y para realizar cualquier tipo de actividad deportiva.
Excelentes terminaciones.
Ideales para media estación.
Viene con bolsillos laterales (no tiene bolsillo atrás).
Puño elastizado.
Elástico en la cintura.
Cordón ajustable para adaptarlo como mas te guste.', 5, CAST(29.99 AS Decimal(10, 2)), 3, N'https://asset.cloudinary.com/dwb12csfd/2dbf9f8d57728f9a0d765bfb35465a92', N'Conjunto Buzo Y Jogging Pantalón')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (26, N'Conjunto Remera Y Short Algodon Racing Club. Estampado de Vinilo Textil de excelente calidad', 4, CAST(25.99 AS Decimal(10, 2)), 3, N'https://asset.cloudinary.com/dwb12csfd/8b4dadec36aaf76e5689e24cb76369c4', N'Conjunto Racing Club Algodon Cortos')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (27, N'Conjunto Camiseta Y Short Deportivo De Futbol-boca Juniors amarillo. Nuestros artículos tienen una excelente confección y terminación en cada prenda, por lo cual te llevas un buen producto.', 4, CAST(38.99 AS Decimal(10, 2)), 3, N'https://asset.cloudinary.com/dwb12csfd/6ea76e162c9f3d791d8f4e25c3a8ab24', N'Conjunto Deportivo De Futbol-Boca Juniors')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (28, N'Conjunto Remera Y Short Corto Pantalon. Estampado de Vinilo Textil de excelente calidad.', 5, CAST(24.99 AS Decimal(10, 2)), 3, N'https://asset.cloudinary.com/dwb12csfd/1834416e4c20aa0f98510f84e195bc8e', N'Conjunto de Futbol-River Plate')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (29, N'Remera + Short - Independiente - Escudo / Fútbol / Logos. 100% ALGODÓN RUSTICO.
- DOS BOLSILLOS LATERALES.
- CINTURA CON ELÁSTICO REFORZADO, CALCE PERFECTO.
- CORDÓN PARA AJUSTAR Y OJAL METALICO.', 5, CAST(21.99 AS Decimal(10, 2)), 3, N'https://asset.cloudinary.com/dwb12csfd/971072dd16d39a092fe44206b66e4886', N'Conjunto de Futbol-Independiente')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (30, N'Conjunto Messi 10 Argentina Seleccion Niño Hombre Futbol. ESPECIFICACIONES: Escudo bordado, letras y/o números en vinilo textil, costura reforzada, TELA W-15 DE POLIÉSTER. Es liviana. Expulsa la humedad interior y tiene un nivel alto de resistencia ante roturas.', 5, CAST(13.99 AS Decimal(10, 2)), 3, N'https://asset.cloudinary.com/dwb12csfd/5d88fb641069c53d1c2cdc3c0c8df5b8', N'Conjunto Messi Argentina Seleccion Niño Hombre')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (31, N'Cuisinart - Cafetera 2 en 1 Coffee Center de 12 tazas - Acero inoxidable negro - Goteo o cápsula, caliente o frío, taza individual o jarra para 12 tazas: disfruta tu café a tu manera con la Cafetera 2 en 1 de Cuisinart. Este esencial de cocina para amantes del café lleva la preparación casera a otro nivel al combinar una jarra de 12 tazas y opciones de taza individual en una unidad conveniente. Prepara una olla completa un 25% más rápido con la tecnología Extreme Brew. Personaliza cuándo y cómo quieres tu café con funciones avanzadas de inicio, pausa de elaboración, control de temperatura, apagado automático y ajustes de sabor intenso', 5, CAST(79.99 AS Decimal(10, 2)), 4, N'https://asset.cloudinary.com/dwb12csfd/5b0f868f2d0bccf8301274bd54ddfa9c', N'Coffee Maker 2 En 1 Cuisinart')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (32, N'High-power kitchen blender', 4, CAST(59.99 AS Decimal(10, 2)), 4, NULL, N'Blender')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (33, N'Compact microwave oven', 5, CAST(99.99 AS Decimal(10, 2)), 4, NULL, N'Microwave Oven')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (34, N'Oil-free air fryer for healthy cooking', 5, CAST(119.99 AS Decimal(10, 2)), 4, NULL, N'Air Fryer')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (35, N'Cordless vacuum cleaner', 4, CAST(149.99 AS Decimal(10, 2)), 4, NULL, N'Vacuum Cleaner')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (36, N'2-slice stainless steel toaster', 4, CAST(39.99 AS Decimal(10, 2)), 4, NULL, N'Toaster')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (37, N'Professional stainless steel knife set', 5, CAST(89.99 AS Decimal(10, 2)), 4, NULL, N'Knife Set')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (38, N'Foldable dish drying rack', 4, CAST(24.99 AS Decimal(10, 2)), 4, NULL, N'Dish Rack')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (39, N'Non-stick cookware set', 5, CAST(199.99 AS Decimal(10, 2)), 4, NULL, N'Cookware Set')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (40, N'Fast boiling electric kettle', 5, CAST(34.99 AS Decimal(10, 2)), 4, NULL, N'Electric Kettle')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (41, N'Adjustable dumbbell set', 5, CAST(79.99 AS Decimal(10, 2)), 5, NULL, N'Dumbbells')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (42, N'Electric running treadmill', 5, CAST(599.99 AS Decimal(10, 2)), 5, NULL, N'Treadmill')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (43, N'Non-slip yoga mat', 4, CAST(29.99 AS Decimal(10, 2)), 5, NULL, N'Yoga Mat')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (44, N'Official size basketball', 4, CAST(24.99 AS Decimal(10, 2)), 5, NULL, N'Basketball')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (45, N'Waterproof camping tent', 5, CAST(129.99 AS Decimal(10, 2)), 5, NULL, N'Tent')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (46, N'Mountain bike with 21-speed gears', 5, CAST(349.99 AS Decimal(10, 2)), 5, NULL, N'Bicycle')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (47, N'Hiking backpack with multiple compartments', 5, CAST(69.99 AS Decimal(10, 2)), 5, NULL, N'Backpack')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (48, N'Adjustable fitness jump rope', 4, CAST(14.99 AS Decimal(10, 2)), 5, NULL, N'Jump Rope')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (49, N'Set of 5 resistance bands', 4, CAST(19.99 AS Decimal(10, 2)), 5, NULL, N'Resistance Bands')
INSERT [dbo].[Products] ([Id], [Description], [Rate], [Price], [CategoryId], [Image], [Title]) VALUES (50, N'Cold-weather sleeping bag', 5, CAST(79.99 AS Decimal(10, 2)), 5, NULL, N'Sleeping Bag')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
