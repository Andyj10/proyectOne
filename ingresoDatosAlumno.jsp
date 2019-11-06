<%
    String nombre = request.getParameter("nombrealum");
    String apellido = request.getParameter("apellidoalum");
    int edad = Integer.parseInt(request.getParameter("edadalum"));
    String sexo = request.getParameter("sexoalum");
    String estado = request.getParameter("estadoalum");
    
    


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recepción de Datos de Alumno</title>
    </head>
    <body>
        Nombre: <%=nombre%> <br />
        Apellido: <%=apellido%> <br />
        Edad: <%=edad%> <br />
        Sexo: <%=sexo%> <br />
        Estado: <%=estado%> <br />
        
    </body>
</html>
