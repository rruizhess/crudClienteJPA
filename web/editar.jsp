<%-- 
    Document   : index
    Created on : 26-01-2017, 20:23:09
    Author     : java
--%>

<%@page import="cl.entities.Producto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.beans.ICrud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        <div class="row">
            <div class="col s4"></div>
            <div class="col s4">


                <%!ICrud crud;%>
                <%
                    InitialContext ctx = new InitialContext();
                    crud = (ICrud) ctx.lookup("micrud");
                    int codigo = Integer.parseInt(request.getParameter("codigo"));
                    Producto prod = crud.buscar(codigo);
                %>
                <c:set var="prod" scope="page" value="<%=prod%>"/>
                
                <form action="control.do" method="post">
                    <input type="text" name="codigo" readonly="true" value="${pageScope.prod.codigo}"/>
                    <input type="text" name="nombre" readonly="true" value="${pageScope.prod.nombre}"/>
                    <input type="text" name="precio" value="${pageScope.prod.precio}" />
                    <input type="text" name="stock" value="${pageScope.prod.stock}"/>
                    <input type="submit" name="bt" value="eliminar" class="btn red darken-1 right"/>&nbsp;
                    <input type="submit" name="bt" value="editar" class="btn light-blue lighten-2 right"/>
                </form>
                <br /><br/>
            </div>
        </div>


        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</html>
