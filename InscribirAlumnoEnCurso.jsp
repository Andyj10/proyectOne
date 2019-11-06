<%@page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String idCurso = request.getParameter("listaCursos");
    String idAlumno = request.getParameter("listaAlumnos");
    
    try
    {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/BDTareas","inacap","inacap");
        Statement st = conn.createStatement();
        
        
       String sql = "insert into inacap.ListaAlumnos "+
                   "(idalumnos, idcurso,estado) values"+
               "("+idAlumno+","+idCurso+",'s')";
     
       st.execute(sql);
       response.sendRedirect("GestionDeCursos.jsp");
      
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
        <h1>Hello World!</h1>
    </body>
</html>
