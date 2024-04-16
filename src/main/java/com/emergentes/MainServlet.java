package com.emergentes;

import com.emergentes.modelo.Seminario;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jhomara
 */
@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action") != null ? request.getParameter("action") : "view";
        System.out.println(action);

        switch (action) {
            case "view":
                response.sendRedirect("index.jsp");
                break;

            case "nuevo":
                Seminario s = new Seminario();
                request.setAttribute("seminario", s);
                request.getRequestDispatcher("edit.jsp").forward(request, response);
                break;

            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                HttpSession sesion = request.getSession();
                List<Seminario> lista = (ArrayList<Seminario>) sesion.getAttribute("seminarios");

                Seminario editSem = new Seminario();
                for (Seminario item : lista) {
                    if (item.getId() == idEditar) {
                        editSem = item;
                        break;
                    }
                }

                request.setAttribute("seminario", editSem);
                request.getRequestDispatcher("edit.jsp").forward(request, response);

                break;

            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                HttpSession sesion1 = request.getSession();
                List<Seminario> lista1 = (ArrayList<Seminario>) sesion1.getAttribute("seminarios");

                for (Seminario item : lista1) {
                    if (item.getId() == idEliminar) {
                        lista1.remove(item);
                        break;
                    }
                }
                response.sendRedirect("index.jsp");
                break;

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String fecha = request.getParameter("fecha");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String turno = request.getParameter("turno");

        String[] sa = request.getParameterValues("seminario");
        String seminariosConcatenados = concatenarSeminarios(sa);

        HttpSession ses = request.getSession();
        List<Seminario> lista = (ArrayList<Seminario>) ses.getAttribute("seminarios");

        if (id == 0) {
            // nuevo registro
            Seminario s = new Seminario();
            int nuevoId = obtenerNuevoId(lista);
            s.setId(nuevoId);
            s.setFecha(fecha);
            s.setNombre(nombre);
            s.setApellidos(apellidos);
            s.setTurno(turno);
            s.setSeminarios(seminariosConcatenados);

            lista.add(s);
        } else {
            for (Seminario item : lista) {
                if (item.getId() == id) {
                    item.setFecha(fecha);
                    item.setNombre(nombre);
                    item.setApellidos(apellidos);
                    item.setTurno(turno);
                    item.setSeminarios(seminariosConcatenados);
                    break;
                }
            }
        }

        response.sendRedirect("index.jsp");

    }

    private int obtenerNuevoId(List<Seminario> lista) {
        int nuevoId = 1;
        for (Seminario item : lista) {
            if (item.getId() >= nuevoId) {
                nuevoId = item.getId() + 1;
            }
        }
        return nuevoId;
    }

    private String concatenarSeminarios(String[] seminarios) {
        if (seminarios != null) {
            return String.join(",", seminarios);
        } else {
            return "";
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
