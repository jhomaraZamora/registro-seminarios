<%-- 
    Document   : edit
    Created on : 14 abr. de 2024, 22:46:36
    Author     : Jhomara
--%>
<%@page import="java.util.Arrays"%>
<%@page import="com.emergentes.modelo.Seminario"%>
<%
    Seminario s = (Seminario) request.getAttribute("seminario");
    
    String sem = s.getSeminarios();
    String[] seminarios = sem.split(",");


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Registro</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <style>
            fieldset, legend {
                all: revert;
            }
        </style>
    </head>
    <body>
       
        <h1 class="text-center">Nuevo Registro</h1>
        <div class="container">
            <div class="row">
                <form action="MainServlet" method="POST">
                    <input type="hidden" name="id" value="<%= s.getId() %>" />
                    <div class="col-12">
                        <fieldset>
                            <legend>Datos</legend>
                            <label for="fecha">Fecha: </label>
                            <input type="date" class="form-control" value="<%= s.getFecha() %>" tabindex="20" name="fecha" />

                            <br>
                            <label for="nombre">Nombres: </label>
                            <input type="text" class="form-control" tabindex="21" value="<%= s.getNombre() %>" name="nombre" />

                            <br>
                            <label for="apellidos">Apellidos: </label>
                            <input type="text" class="form-control" tabindex="22" name="apellidos" value="<%= s.getApellidos() %>"/>


                            <br>
                            <label for="turno">Turno: </label> &nbsp;
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="turno" id="inlineCheckbox1" value="Mañana" <%= (s.getTurno() == "Mañana")? "checked": ""%>>
                                <label class="form-check-label" for="inlineCheckbox1">Mañana</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="turno" id="inlineCheckbox2" value="Tarde" <%= (s.getTurno() == "Tarde")? "checked": ""%>>
                                <label class="form-check-label" for="inlineCheckbox2">Tarde</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="turno" id="inlineCheckbox3" value="Noche" <%= (s.getTurno() == "Noche")? "checked": ""%>>
                                <label class="form-check-label" for="inlineCheckbox3">Noche</label>
                            </div>

                        </fieldset>
                    </div>

                    <div class="col-12 mt-2">
                        <fieldset>
                            <legend>Seminario disponibles</legend>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="Inteligencia Artifical" name="seminario" <%= Arrays.asList(seminarios).contains("Inteligencia Artifical")? "checked": "" %> >
                                <label class="form-check-label" for="flexCheckDisabled">
                                    Inteligencia Artifical
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="Machine Learning"  name="seminario" <%= Arrays.asList(seminarios).contains("Machine Learning")? "checked": "" %>>
                                <label class="form-check-label" for="flexCheckCheckedDisabled">
                                    Machine Learning
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="Simulación con Arena" name="seminario" <%= Arrays.asList(seminarios).contains("Simulación con Arena")? "checked": "" %>>
                                <label class="form-check-label" for="flexCheckCheckedDisabled">
                                    Simulación con Arena
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="Robótica Educativa" name="seminario" <%= Arrays.asList(seminarios).contains("Robótica Educativa")? "checked": "" %>>
                                <label class="form-check-label" for="flexCheckCheckedDisabled">
                                    Robótica Educativa
                                </label>
                            </div>

                        </fieldset>
                    </div>
                    
                    <div class="d-flex justify-content-center mt-2">
                        <button class="btn btn-primary" type="submit">Enviar</button>
                    </div>

                </form>

            </div>
        </div>
    </body>
</html>
