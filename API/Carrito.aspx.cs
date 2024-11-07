using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace API
{
    public partial class Carrito : System.Web.UI.Page
    {
        // Lista para guardar los productos que el usuario ha agregado al carrito.
        public List<Producto> CarritoItems { get; set; }

        // Variable que mantiene el total de lo que cuesta todo lo que está en el carrito.
        public decimal TotalCarrito { get; set; }

        // Aquí guardamos la URL que se usará para pagar con PayPal.
        public string PayPalUrl { get; set; }

        // Esto se ejecuta cada vez que cargamos la página.
        protected void Page_Load(object sender, EventArgs e)
        {
            // Si no existe el carrito en la sesión (memoria temporal mientras navegas), lo inicializamos como una lista vacía.
            if (Session["Carrito"] == null)
            {
                Session["Carrito"] = new List<Producto>();
            }

            // Recuperamos lo que ya había en el carrito de la sesión para seguir usándolo.
            CarritoItems = Session["Carrito"] as List<Producto>;

            // Verificamos si hay un nuevo producto para agregar a través de la URL (los parámetros prod y precio).
            if (!string.IsNullOrEmpty(Request.QueryString["prod"]) && !string.IsNullOrEmpty(Request.QueryString["precio"]))
            {
                // Guardamos el nombre del producto y su precio que llegaron por la URL.
                string nombreProducto = Request.QueryString["prod"];
                decimal precioProducto = Convert.ToDecimal(Request.QueryString["precio"]);

                // Agregamos ese nuevo producto al carrito.
                CarritoItems.Add(new Producto { Nombre = nombreProducto, Precio = precioProducto });

                // Guardamos el carrito actualizado nuevamente en la sesión.
                Session["Carrito"] = CarritoItems;
            }

            // Si en la URL hay un producto para eliminar (parámetro "eliminar"), lo sacamos del carrito.
            if (!string.IsNullOrEmpty(Request.QueryString["eliminar"]))
            {
                // Buscamos por el nombre del producto que queremos eliminar.
                string nombreEliminar = Request.QueryString["eliminar"];
                CarritoItems.RemoveAll(item => item.Nombre == nombreEliminar); // Lo quitamos de la lista.
            }

            // Guardamos otra vez el carrito actualizado en la sesión.
            Session["Carrito"] = CarritoItems;

            // Calculamos el total de todo lo que está en el carrito.
            TotalCarrito = 0;
            foreach (var item in CarritoItems)
            {
                TotalCarrito += item.Precio;
            }

            // Armamos la URL de PayPal con el total del carrito para que el usuario pueda pagar.
            PayPalUrl = $"https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=tu-email@paypal.com&item_name=Compra&amount={TotalCarrito}&currency_code=USD";
        }

        // Clase que define cómo es un producto: nombre y precio.
        public class Producto
        {
            public string Nombre { get; set; }
            public decimal Precio { get; set; }
        }
    }

}