<%-- 
    Document   : index
    Created on : 26-01-2017, 20:23:09
    Author     : java
--%>

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
                <form action="control.do" method="post">
                    <input type="text" name="nombre" placeholder="Nombre"/>
                    <input type="text" name="precio" placeholder="Precio"/>
                    <input type="text" name="stock" placeholder="Stock"/>
                    <input type="submit" name="bt" value="crear" class="btn light-blue lighten-2 right"/>
                </form>
                <br /><br/>
                
                <%!ICrud crud;%>
                <%
                    InitialContext ctx = new InitialContext();
                    crud = (ICrud) ctx.lookup("micrud");
                %>
                <c:set var="crud" scope="page" value="<%=crud%>"/>
                <table class="bordered">
                    <tr>
                        <td>Codigo</td>
                        <td>Nombre</td>
                        <td>Precio</td>
                        <td>Stock</td>
                        <td></td>
                    </tr>
                    <c:forEach items="${pageScope.crud.productos}" var="p">
                        <tr>
                            <td>${p.codigo}</td>
                            <td>${p.nombre}</td>
                            <td>${p.precio}</td>
                            <td>${p.stock}</td>
                            <td>
                                <a href="editar.jsp?codigo=${p.codigo}" class="btn-floating btn light-blue lighten-1">
                                    <i class="material-icons">edit</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <br/><br/>
                ${requestScope.msg}
            </div>
        </div>


        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</html>
