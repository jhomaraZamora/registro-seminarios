<%-- 
    Document   : index
    Created on : 14 abr. de 2024, 21:11:07
    Author     : Jhomara
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Seminario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

    if (session.getAttribute("seminarios") == null) {
        ArrayList<Seminario> listaAux = new ArrayList<Seminario>();
        session.setAttribute("seminarios", listaAux);
    }
    
    List<Seminario> lista = (ArrayList<Seminario>) session.getAttribute("seminarios");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Seminarios</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
 
        
        <h1 class="text-center">Listado de Inscritos</h1>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="d-flex">
                        <a class="btn btn-primary" href="MainServlet?action=nuevo">Nuevo</a>
                    </div>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Fecha</th>
                                <th>Nombre</th>
                                <th>Apellidos</th>
                                <th>Turno</th>
                                <th>Seminarios</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            <% for(Seminario s: lista){ %>
                                <tr>
                                    <td><%= s.getId() %></td>
                                    <td><%=s.getFecha() %></td>
                                    <td><%=s.getNombre() %></td>
                                    <td><%=s.getApellidos() %></td>
                                    <td><%=s.getTurno() %></td>
                                    <td><%=s.getSeminarios() %></td>
                                    <td>
                                        <a href="MainServlet?action=editar&id=<%=s.getId() %>">Editar</a> |
                                         <a href="MainServlet?action=eliminar&id=<%=s.getId() %>">Eliminar</a>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </body>
</html>
