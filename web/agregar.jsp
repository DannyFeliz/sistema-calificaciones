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
                    <li><a href="/run/index.jsp">Estudiantes</a></li>
                    <li class="active"><a href="/run/agregar.jsp">Agregar Estudiante</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
        <!--/.container-fluid -->
    </nav>
    <!-- Main component for a primary marketing message or call to action -->
    <div class="container">
        <div class="jumbotron">
        <h2>Agregar Estudiante</h2>
        <hr>
        <form method="post" action="/run/agregar_estudiante">
            <div class="">
                <div class="form-group">
                    <label for="id">Matrícula</label>
                    <input type="number" class="form-control" id="id" name="id" placeholder="20152015" required>
                </div>
                <div class="form-group">
                    <label for="name">Nombre</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Juan Perez" required>
                </div>
                <div class="form-group">
                    <label for="grade">Calificación</label>
                    <select class="form-control" id="grade" name="grade" required>
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
</body>

</html>