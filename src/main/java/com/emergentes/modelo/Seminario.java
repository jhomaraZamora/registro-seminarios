
package com.emergentes.modelo;

/**
 *
 * @author Jhomara
 */
public class Seminario {
    int id;
    String fecha;
    String nombre;
    String apellidos;
    String turno;
    String seminarios;

    public Seminario(int id, String fecha, String nombre, String apellidos, String turno, String seminarios) {
        this.id = id;
        this.fecha = fecha;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.turno = turno;
        this.seminarios = seminarios;
    }

    public Seminario() {
        this.id = 0;
        this.fecha = "2024-04-15";
        this.nombre = "";
        this.apellidos = "";
        this.turno = "Mañana";
        this.seminarios = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public String getSeminarios() {
        return seminarios;
    }

    public void setSeminarios(String seminarios) {
        this.seminarios = seminarios;
    }

    
}
