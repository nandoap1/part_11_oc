<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.producto"%>

<%
    if (session.getAttribute("almacen") == null) {
        ArrayList<producto> lisaux = new ArrayList<producto>();
        session.setAttribute("almacen", lisaux);
    }
    ArrayList<producto> almacen = (ArrayList<producto>) session.getAttribute("almacen");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Carrito de compras</h1>
        <p>Inserte los productos que desea</p>
        <form action="ProcesaServlets" method="POST">
            id: <input type="number" name="id"><br>
            producto: <input type="text" name="producto" value="" /><br>
            cantidad: <input type="number" name="cantidad"><br>
            precio: <input type="text" name="precio">
            <br>
            <input type="submit"  value="Enviar" />     
        </form>
        <br>   
        <a href="ProcesaServlets?op=vaciar">Vaciar carrito</a>
        <h3>Contenido del carrito</h3>
        <table border="1">
            <tr>
                <th>id</th>
                <th>producto</th>
                <th>Cantidad</th>
                <th>precio</th>
                <th></th>

            </tr>
            <%
                if (almacen != null) {
                    for (producto p : almacen) {


            %>
            <tr>
                <td> <%=p.getId()%> </td>
                <td> <%=p.getProducto()%> </td>
                <td> <%=p.getCantidad()%> </td>
                <td> <%=p.getPrecio()%> </td>
                <td><a href="ProcesaServlets?op=eliminar&AMP;id=<%= p.getId()%> " >eliminar</a> </td>
            </tr>
            <%
                    }
                }
            %>
        </table>

    </body>
</html>
