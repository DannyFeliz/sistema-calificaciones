import entities.Student;
import lib.Excel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Danny on 08/10/2016.
 */
@WebServlet(name = "agregar_estudiante")
public class agregar_estudiante extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Student student = new Student();
        student.setId(request.getParameter("id"));
        student.setName(request.getParameter("name"));
        student.setGrade(request.getParameter("grade"));

        Excel excel = new Excel();
        excel.addStudent(student);
        response.sendRedirect("/run/");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
