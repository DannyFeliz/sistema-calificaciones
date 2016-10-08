<%@ page import="lib.Excel" %>
<%@ page import="entities.Student" %><%--
  Created by IntelliJ IDEA.
  User: Danny
  Date: 08/10/2016
  Time: 12:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <title>The title</title>
    <link rel="stylesheet" href="public/css/bootstrap.min.css">
</head>

<body>
<!-- Static navbar -->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Sistema de Calificaciones</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="/run/index.jsp">Estudiantes</a></li>
                <li><a href="/run/agregar.jsp">Agregar Estudiante</a></li>
                <li class="active"><a href="/editar">Editar Estudiante</a></li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
    <!--/.container-fluid -->
</nav>

<%
    String studentId = request.getParameter("id");
    Excel excel = new Excel();
    Student student = excel.loadStudentData(studentId);
%>


<!-- Main component for a primary marketing message or call to action -->
<div class="container">
    <div class="jumbotron">
        <h2>Editar Estudiante</h2>
        <hr>
        <form method="post" action="/run/editar_estudiante">
            <div class="" >
                <%--<div class="form-group">--%>
                    <%--<label for="number">Numero</label>--%>
                    <input type="hidden" class="form-control" id="number" name="number" placeholder="563" value='<%= request.getParameter("id") %>'>
                <%--</div>--%>
                <div class="form-group">
                    <label for="id">Matrícula</label>
                    <input type="number" class="form-control" id="id" name="id" placeholder="20152015" required max="99999999" value="<%=student.getId()%>">
                </div>
                <div class="form-group">
                    <label for="name">Nombre</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Juan Perez" required value="<%=student.getName()%>">
                </div>
                <div class="form-group">
                    <label for="grade">Calificación</label>
                    <select class="form-control" id="grade" name="grade">
                        <option value="A">A (Excelente)</option>
                        <option value="B">B (Bueno)</option>
                        <option value="C">C (Regular)</option>
                        <option value="D">D (Reprobado)</option>
                        <option value="F">F (Reprobado)</option>
                    </select>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Guardar</button>
        </form>
    </div>
</div>

<script>
    document.querySelector("#grade").value = '<%=student.getGrade()%>'
</script>


</body>

</html>