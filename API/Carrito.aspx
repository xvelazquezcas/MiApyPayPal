<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="API.Carrito" %>
<script src="https://www.paypal.com/sdk/js?client-id=Af6_NajPxmzcmIkbdHLiURfyJL52ARkIFaerE7FdPWDifAz4hvkHmRwWuHWOZItpIeNX7KzNbvfmyzHl"></script>

<!DOCTYPE html>
<html>
<head>
    <title>Carrito de Compras</title>
    <style>
        /* Estilos básicos para que la página se vea bonita */
        body {
            font-family: Arial, sans-serif; /* Cambiamos la fuente */
        }
        table {
            width: 100%; /* La tabla ocupa todo el ancho de la página */
            border-collapse: collapse; /* Sin espacios entre las celdas */
        }
        table, th, td {
            border: 1px solid #ccc; /* Bordes ligeros alrededor de la tabla y celdas */
        }
        th, td {
            padding: 10px; /* Espaciado dentro de las celdas */
            text-align: left; /* Alineación del texto a la izquierda */
        }
        .total {
            text-align: right; /* Alinea el texto del total a la derecha */
            padding: 20px; /* Un poco de espacio alrededor */
        }
        .btn-pagar {
            padding: 10px 20px; /* Tamaño del botón de pagar */
            background-color: #4CAF50; /* Color verde para el botón de pagar */
            color: white; /* Texto en blanco */
            border: none; /* Sin bordes */
            border-radius: 5px; /* Bordes redondeados */
            cursor: pointer; /* Cambia el cursor a una mano cuando pasas por encima */
        }
        .btn-eliminar {
            padding: 5px 10px; /* Botón de eliminar más pequeño */
            background-color: #f44336; /* Color rojo para el botón de eliminar */
            color: white; /* Texto en blanco */
            border: none; /* Sin bordes */
            border-radius: 5px; /* Bordes redondeados */
            cursor: pointer; /* Cambia el cursor a una mano */
        }
        #paypal-button-container {
            display: flex;
            justify-content: center; /* Centra el botón de PayPal en la página */
            margin: 20px 0; /* Espaciado alrededor del botón */
        }
    </style>
    <!-- Incluimos el SDK de PayPal para crear el botón de pago -->
    <script src="https://www.paypal.com/sdk/js?client-id=Af6_NajPxmzcmIkbdHLiURfyJL52ARkIFaerE7FdPWDifAz4hvkHmRwWuHWOZItpIeNX7KzNbvfmyzHl"></script>
</head>
<body>
    <h1>Carrito de Compras</h1>
    
    <!-- Creamos la tabla donde mostramos los productos del carrito -->
    <table>
        <thead>
            <tr>
                <th>Producto</th> <!-- Columna para el nombre del producto -->
                <th>Precio</th> <!-- Columna para el precio del producto -->
                <th>Acciones</th> <!-- Nueva columna para las acciones (como eliminar) -->
            </tr>
        </thead>
        <tbody id="carritoItems">
            <!-- Aquí recorremos los productos del carrito usando código de servidor (ASP.NET) -->
            <% foreach (var item in CarritoItems) { %>
            <tr>
                <td><%= item.Nombre %></td> <!-- Mostramos el nombre del producto -->
                <td>$<%= item.Precio %></td> <!-- Mostramos el precio del producto -->
                <td>
                    <!-- Botón para eliminar el producto del carrito, llama a la función JavaScript 'eliminarProducto' -->
                    <button class="btn-eliminar" onclick="eliminarProducto('<%= item.Nombre %>')">Eliminar</button> 
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <!-- Muestra el total calculado de todos los productos del carrito -->
    <div class="total">
        <h2>Total: $<%= TotalCarrito %></h2>
    </div>

     <!-- Botón para regresar a la tienda -->
    <div style="text-align: center; margin-top: 20px;">
        <button class="btn-regresar" onclick="location.href='Productos.aspx'">Regresar a la Tienda</button>
    </div>

    <!-- Aquí es donde se renderizará el botón de PayPal -->
    <div id="paypal-button-container"></div> 

    <script>
        /* Esta función se ejecuta cuando el usuario hace clic en "Eliminar". Redirige la página para eliminar el producto. */
        function eliminarProducto(nombre) {
            // Redirige a una URL con el producto a eliminar
            window.location.href = 'Carrito.aspx?eliminar=' + encodeURIComponent(nombre);
        }

        /* Aquí configuramos el botón de PayPal */
        paypal.Buttons({
            createOrder: function(data, actions) {
                /* Cuando el usuario inicia el proceso de pago, creamos una orden con el total del carrito */
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '<%= TotalCarrito %>' // El total que se va a pagar en PayPal
                        }
                    }]
                });
            },
            onApprove: function (data, actions) {
                /* Cuando el usuario autoriza el pago, capturamos la orden y mostramos un mensaje */
                return actions.order.capture().then(function (details) {
                    alert('Pago realizado por ' + details.payer.name.given_name); // Confirmación del pago
                    // Aquí puedes redirigir o realizar otras acciones
                });
            },
            onError: function (err) {
                /* Si ocurre un error en el proceso de pago, mostramos un mensaje */
                console.error(err);
                alert('Ocurrió un error durante el pago. Por favor, inténtalo de nuevo.');
            }
        }).render('#paypal-button-container'); // Renderizamos el botón dentro del div con id 'paypal-button-container'
    </script>
</body>
</html>
