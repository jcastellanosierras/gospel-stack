# Notas sobre el esquema de la base de datos

Se ha dividido el esquema en 3 modulos principales, b2b, b2c y client. Notas generales sobre el objetivo de cada uno de los modulos:
- **b2b**: representa el esquema asociado a la aplicacion para gestionar el catalogo, que esta principalmente destinada a proveedores y fabricantes:
 - Gestionar sus productos
 - Gestionar sus marcas
 - Gestionar sus categorias de producto
- **b2c**: representa la aplicacion para los tenderos/comercios en la que podrán entre otras cosas:
 - gestionar catalogo importando productos de forma sencilla a su inventario
 - poder sincronizar productos/stock de forma sencilla con la base de datos de cliente
 - en un futuro podria derivar en un TPV y en un futuro mas lejano en un ERP completo al estilo Holded
- **client**: representa la aplicacion dedicada al cliente final en la cual podra
 - buscar un producto y ver en que comercios esta disponible.
 - realizar compras directamente al comercio a traves de la aplicacion
