# WebApiProducts

Una API REST desarrollada con **.NET 8** para gestionar productos y categorías. La API incluye caché con **Redis** para optimizar el rendimiento y reducir la carga en la base de datos.

## 🚀 Producción

La API está deployada en **Monster ASP.NET Hosting**:

**URL Base:** `https://web-api-products.runasp.net`

**Swagger Documentation:** `https://web-api-products.runasp.net/swagger/index.html`

---

## 📚 Endpoints

### Products (Productos)

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| **GET** | `/api/Products` | Obtiene todos los productos |
| **GET** | `/api/Products/{id}` | Obtiene un producto por ID |
| **POST** | `/api/Products` | Crea un nuevo producto |
| **PUT** | `/api/Products/{id}` | Actualiza un producto |
| **DELETE** | `/api/Products/{id}` | Elimina un producto |

#### Ejemplos de uso:

```bash
# Obtener todos los productos
curl -X GET "https://web-api-products.runasp.net/api/Products" \
  -H "accept: application/json"

# Obtener producto por ID
curl -X GET "https://web-api-products.runasp.net/api/Products/1" \
  -H "accept: application/json"
```

---

### Categories (Categorías)

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| **GET** | `/api/Categories` | Obtiene todas las categorías |
| **GET** | `/api/Categories/{id}` | Obtiene una categoría por ID |
| **POST** | `/api/Categories` | Crea una nueva categoría |
| **PUT** | `/api/Categories/{id}` | Actualiza una categoría |
| **DELETE** | `/api/Categories/{id}` | Elimina una categoría |

#### Ejemplos de uso:

```bash
# Obtener todas las categorías
curl -X GET "https://web-api-products.runasp.net/api/Categories" \
  -H "accept: application/json"

# Obtener categoría por ID
curl -X GET "https://web-api-products.runasp.net/api/Categories/1" \
  -H "accept: application/json"
```

---

## 🛠️ Tecnologías

- **.NET 8** - Framework principal
- **Entity Framework Core** - ORM para acceso a datos
- **SQL Server** - Base de datos
- **Redis** - Cache distribuido
- **Swagger/OpenAPI** - Documentación interactiva de API
- **Docker** - Containerización

---

## 🔧 Requisitos Locales

- **.NET 8 SDK** o superior
- **SQL Server** (LocalDB, Express o full)
- **Redis** (via Docker o instalación local)

---

## 📝 Configuración Local

### 1. Clonar el repositorio

```bash
git clone https://github.com/carlos0718/WebApiProducts.git
cd WebApiProducts
```

### 2. Configurar Redis (Docker)

```powershell
# Iniciar Redis
docker run -d -p 6379:6379 --name redis redis:latest

# Verificar conexión
docker exec -it redis redis-cli ping
# Debería responder: PONG
```

### 3. Configurar la base de datos

Actualizar la cadena de conexión en `appsettings.json`:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=YOUR_SERVER;Database=ApiEcommerce;Trusted_Connection=True;"
  }
}
```

### 4. Aplicar migraciones (si existen)

```bash
dotnet ef database update
```

### 5. Ejecutar la aplicación

```bash
dotnet run
```

La API estará disponible en `https://localhost:7xxx/swagger`

---

## 📊 Características

✅ **Caché con Redis** - Almacenamiento en caché de productos y categorías
✅ **Swagger/OpenAPI** - Documentación interactiva
✅ **Manejo de excepciones** - Respuestas de error detalladas
✅ **CORS habilitado** - Acceso desde cualquier origen
✅ **Logging** - Seguimiento de operaciones
✅ **Validación de datos** - Entidades validadas

---

## 👨‍💻 Autor

**Carlos Jesus** - [Portfolio](https://portfolio-master-carlos-jesus.vercel.app/)

---

## 📄 Licencia

Este proyecto está bajo licencia MIT.