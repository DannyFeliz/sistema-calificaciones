<%@ page import="lib.Excel" %><%--
  Created by IntelliJ IDEA.
  Student: Danny
  Date: 07/10/2016
  Time: 11:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
  <meta charset="utf-8">
  <title>The title</title>
  <link rel="stylesheet" href="public/css/bootstrap.min.css">
  <link rel="stylesheet" href="public/css/jquery.dataTables.min.css">
</head>

<body>
  <!-- Static navbar -->
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Sistema de Calificaciones</a>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Estudiantes</a></li>
          <li><a href="/run/agregar.jsp">Agregar Estudiante</a></li>
        </ul>
      </div>
      <!--/.nav-collapse -->
    </div>
    <!--/.container-fluid -->
  </nav>
  <!-- Main component for a primary marketing message or call to action -->
  <div class="container">

  <div class="jumbotron">
    <h2>Lista de Estudiantes</h2>
    <table class="table table-hover">
      <thead>
      <tr>
        <th>No.</th>
        <th>Matrícula</th>
        <th>Nombre</th>
        <th>Calificacion</th>
        <th>Editar Estudiante</th>
      </tr>
      </thead>
      <tbody>

      <%
        Excel lib = new Excel();
        String tableData = lib.generateTableData();
      %>

      <%= tableData %>

      <%--<tr>--%>
        <%--<td>1</td>--%>
        <%--<td>20152015</td>--%>
        <%--<td>Danny Feliz</td>--%>
        <%--<td>A</td>--%>
        <%--<td><a href="#">Editar</a></td>--%>
      <%--</tr>--%>
      </tbody>
    </table>
  </div>
</div>

<script src="public/js/jquery.js"></script>
<script src="public/js/jquery.dataTables.min.js"></script>
<script>
  $(document).ready(function(){
    $('.table').DataTable({
//      "bLengthChange": false,
      "language": {
        "sProcessing":     "Procesando...",
        "sLengthMenu":     "Mostrar _MENU_ estudiantes",
        "sZeroRecords":    "No se encontraron resultados",
        "sEmptyTable":     "Ningún dato disponible en esta tabla",
        "sInfo":           "Mostrando estudiantes del _START_ al _END_ de un total de _TOTAL_ estudiantes",
        "sInfoEmpty":      "Mostrando estudiantes del 0 al 0 de un total de 0 estudiantes",
        "sInfoFiltered":   "(filtrado de un total de _MAX_ estudiantes)",
        "sInfoPostFix":    "",
        "sSearch":         "Buscar:",
        "sUrl":            "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",
        "oPaginate": {
          "sFirst":    "Primero",
          "sLast":     "Último",
          "sNext":     "Siguiente",
          "sPrevious": "Anterior"
        },
        "oAria": {
          "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
          "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        }
      }
    });
  });
</script>
</body>

</html>

