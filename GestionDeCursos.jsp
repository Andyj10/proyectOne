<%@page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    ResultSet rsAlumnos = null;
    ResultSet rsCursos = null;
    ResultSet rsListado = null;
    try
    {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/BDTareas","inacap","inacap");
        Statement stAlumnos = conn.createStatement();
        Statement stCursos = conn.createStatement();
        Statement stListado = conn.createStatement();
        
       String sql1 = "select * from inacap.Alumno";
       String sql2 = "select * from inacap.Curso";
       String sql3 = "select "
               + "nombre ,apellido ,nombreprofersor,asignatura "+
               "from "
               +"inacap.ALUMNO, inacap.CURSO, inacap.LISTAALUMNOS "
               + "where "
               + "inacap.LISTAALUMNOS.IDCURSO = inacap.CURSO.ID "
               + "and "
               + "inacap.LISTAALUMNOS.IDALUMNOS = inacap.ALUMNO.ID";
       
       //Revisar si el usuario solicito o no una busqueda especial.
       String tipoBusqueda =request.getParameter("tipobusqueda");
       String txtBusqueda =request.getParameter("txtbusqueda");
       
       if(tipoBusqueda != null & txtBusqueda != null)
       {
        if (tipoBusqueda.equals("a"))
            sql3 = sql3 + " and inacap.alumno.nombre='"+ txtBusqueda +"'";
        else if(tipoBusqueda.equals("c"))
         sql3 = sql3 + " and inacap.curso.asignatura='"+ txtBusqueda +"'";  
       }
       
       rsAlumnos = stAlumnos.executeQuery(sql1);
       rsCursos = stCursos.executeQuery(sql2);
       rsListado = stListado.executeQuery(sql3);
    }
    catch(Exception e)
    {
        out.println("Exception de Sql" + e);
        return;
    }%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>gestion de Cursos</h1>
        <h3>
        Asociacion de un alumno con un curso
    </h3>
        <hr />
        
        <form action="InscribirAlumnoEnCurso.jsp">
            
            Cursos:
            <select name="listaCursos" size="10">
                <option value="">Seleccione un Curso</option>
                <%while(rsCursos.next()) { %>
                <option value="<%=rsCursos.getLong("id")%>"> 
                <%=rsCursos.getString("asignatura")%>
                
                </option>
                
                <%}%>
                
            </select>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Alumnos
            <select name="listaAlumnos" size="10">
                <option value="">Seleccione un Alumno</option>
                <%while(rsAlumnos.next()) { %>
                <option value="<%=rsAlumnos.getLong("id")%>"> 
                <%=rsAlumnos.getString("apellido") %>,
                <%=rsAlumnos.getString("nombre")  %>
                </option>
                <%}%>
            </select>
            
            <input type="submit" value="Incribir alumno" />
            
        </form>
            <h3>Listado de cursos con alumnos</h3>
            
            <hr />
            <form action="GestionDeCursos">
                Buscar:<input type="text" name="txtbusqueda"/>
                &nbsp;&nbsp;&nbsp;&nbsp;
                Por nombre Alumno <input type="radio" name="tipobusqueda" value="a" />
                Por nombre Curso <input type="radio" name="tipobusqueda" value="c" />
                <br/><br/>
                <input type="submit" value="Realizar busqueda" /><br/><br/>
                
            </form>
            <table width="800" border="1">
                <tr>
                    <td>Asignatura</td>
                    <td>Nombre Profesor</td>
                    <td>Nombre Alumno</td>
                    <td>Operaciones</td>
                </tr>
                <% while (rsListado.next()) {%>
                <tr>
                    <td><%=rsListado.getString("asignatura")%></td>
                    <td><%=rsListado.getString("nombreprofersor")%></td>
                    <td><%=rsListado.getString("apellido")%>,
                    <%=rsListado.getString("nombre")%>
                    </td>
                    <td></td>
                    
                </tr>
                
                <%}%>
            </table>
           
        
    </body>
    
    
    
    
</html>
