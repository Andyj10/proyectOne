<%@page import="java.sql.*"%>
<%
     String idAlumno = request.getParameter("id"); // Importante !!!!!!! 
     try
    {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/BDTareas", "inacap","inacap");
        Statement st = conn.createStatement();
        String sql = "delete from inacap.Alumno where id=" +idAlumno;
        
        //Para ejecutar la sentencia 
         st.execute(sql);
        //Para volver al listado ..
         response.sendRedirect("Listado.jsp");
    }
    catch(SQLException e)
    {
        out.println("Excepcion de SQL :" + e);
        return;
    }


%>
