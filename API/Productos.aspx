<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="API.Productos" %>

<!DOCTYPE html>
<html>
<head>
    <title>Tienda Online - Productos</title>
    <style>
        /* Establecemos una fuente básica para todo el contenido */
        body {
            font-family: Arial, sans-serif;
        }

        /* Definimos un layout de cuadrícula para los productos, con 3 columnas */
        .product-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* Tres columnas iguales */
            gap: 20px; /* Espacio entre los productos */
            padding: 20px; /* Espacio alrededor del contenedor de productos */
        }

        /* Estilos para cada producto */
        .product {
            border: 1px solid #ccc; /* Un borde gris claro alrededor del producto */
            padding: 20px; /* Espacio dentro de cada tarjeta de producto */
            border-radius: 5px; /* Bordes ligeramente redondeados */
            text-align: center; /* Centrar todo el contenido del producto */
        }

        /* Asegura que las imágenes de los productos no se desborden y se adapten al tamaño del contenedor */
        .product img {
            max-width: 100%; /* La imagen nunca será más grande que el contenedor */
            height: auto; /* La altura se ajusta automáticamente */
        }

        /* Estilo para los nombres de los productos (los títulos) */
        .product h3 {
            font-size: 1.5em; /* Tamaño de fuente grande para destacar el nombre */
        }

        /* Estilos para la descripción y detalles del producto */
        .product p {
            font-size: 1em; /* Tamaño de fuente normal */
            color: #666; /* Color de texto gris para darle un toque más suave */
        }

        /* Estilo para los botones de "Agregar al carrito" */
        .product button {
            padding: 10px 20px; /* Un relleno para hacer el botón más grande */
            background-color: #4CAF50; /* Color verde atractivo */
            color: white; /* Texto blanco para contraste */
            border: none; /* Sin borde visible */
            border-radius: 5px; /* Bordes redondeados */
            cursor: pointer; /* Cambia el cursor a una mano cuando se pasa sobre el botón */
        }

        /* Cambia el color del botón cuando pasas el mouse encima */
        .product button:hover {
            background-color: #45a049; /* Un verde más oscuro al pasar el mouse */
        }
    </style>
</head>
<body>
    <h1>Nuestros Productos</h1> <!-- Título principal de la página -->

    <div class="product-container">
        <%-- Producto 1 --%>
        <div class="product">
            <!-- Imagen del producto -->
            <img src="img/th%20(1).jpeg" " alt="Producto 1" />
            <!-- Nombre del producto -->
            <h3>Producto 1</h3>
            <!-- Descripción breve -->
            <p>Materiales: Algodón, Poliéster</p>
            <!-- Precio del producto -->
            <p>Precio: $20.00</p>
            <!-- Descripción detallada -->
            <p>Descripción: Camiseta de alta calidad</p>
            <!-- Botón para agregar el producto al carrito, que redirige con parámetros en la URL -->
            <button onclick="location.href='Carrito.aspx?prod=Producto1&precio=20'">Agregar al Carrito</button>
        </div>

        <%-- Producto 2 --%>
        <div class="product">
            <img src="img/bolso.jpg" alt="Producto 2" />
            <h3>Producto 2</h3>
            <p>Materiales: Cuero</p>
            <p>Precio: $50.00</p>
            <p>Descripción: Bolso de cuero genuino</p>
            <button onclick="location.href='Carrito.aspx?prod=Producto2&precio=50'">Agregar al Carrito</button>
        </div>

        <%-- Producto 3 --%>
        <div class="product">
            <img src="img/reloj.jpg" alt="Producto 3"/>
            <h3>Reloj Samsung</h3>
            <p>Materiales: Metal, Plástico</p>
            <p>Precio: $1499.00</p>
            <p>Descripción: Reloj deportivo</p>
            <button onclick="location.href='Carrito.aspx?prod=Reloj Samsung&precio=1499'">Agregar al Carrito</button>
        </div>

        <%-- Producto 4 --%>
        <div class="product">
            <img src="img/Lampara.jpg" alt="Producto 4"/>
            <h3>Lámpara led</h3>
            <p>Materiales: Cristal</p>
            <p>Precio: $220.00</p>
            <p>Descripción: Lámpara elegante</p>
            <button onclick="location.href='Carrito.aspx?prod=Lampara led&precio=220'">Agregar al Carrito</button>
        </div>

        <%-- Producto 5 --%>
        <div class="product">
            <img src="img/audifonos.jpg" alt="Producto 5"/>
            <h3>Auriculares SONY</h3>
            <p>Materiales: Plástico, Metal</p>
            <p>Precio: $500.00</p>
            <p>Descripción: Auriculares inalámbricos</p>
            <button onclick="location.href='Carrito.aspx?prod=Auriculares SONY&precio=500'">Agregar al Carrito</button>
        </div>
    </div>
</body>
</html>
