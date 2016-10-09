package lib;

import entities.Student;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;

public class Excel {

    private XSSFWorkbook workbook;
    private Sheet sheet;
    private final String FILE_NAME = "calificaciones.xlsx";
    private final String FILE_PATH = "C:/Users/Danny/workspace/SistemaCalificaciones/files/";
    private final String FULL_FILE_PATH = FILE_PATH + FILE_NAME;
    private DataFormatter fmt = new DataFormatter();

    public Excel() throws IOException {
        File file = new File(FULL_FILE_PATH);
        if (!file.exists()) {
            createFile();
        }
    }

    /**
     * Create excel file with its own sheet
     * @throws IOException
     */
    private void createFile() throws IOException {
        this.workbook = new XSSFWorkbook();
        this.sheet = this.workbook.createSheet("Calificaciones");

        FileOutputStream fileContent = new FileOutputStream(FULL_FILE_PATH);
        this.workbook.write(fileContent);
        fileContent.close();
        this.workbook.close();
    }

    /**
     * Add a student to the file
     * @param student
     * @throws IOException
     */
    public void addStudent(Student student) throws IOException {
        loadFile();
        int currentRow = this.sheet.getPhysicalNumberOfRows();

        Row row = this.sheet.createRow(currentRow);

        Cell number = row.createCell(0);
        number.setCellValue(currentRow + 1);

        Cell id = row.createCell(1);
        id.setCellValue(student.getId());

        Cell nameCell = row.createCell(2);
        nameCell.setCellValue(student.getName());

        Cell grade = row.createCell(3);
        grade.setCellValue(student.getGrade());

        saveChanges();
    }


    /**
     * Edit a student that exists in the file
     * @param student
     * @throws IOException
     */
    public void editStudent(Student student) throws IOException {
        loadFile();

        Row row = this.sheet.getRow(Integer.parseInt(student.getNumber()) - 1);

        Cell number = row.createCell(0);
        number.setCellValue(student.getNumber());

        Cell id = row.createCell(1);
        id.setCellValue(student.getId());

        Cell nameCell = row.createCell(2);
        nameCell.setCellValue(student.getName());

        Cell grade = row.createCell(3);
        grade.setCellValue(student.getGrade());

        saveChanges();
    }

    /**
     * Load the students data to display it in the edit view
     * @param  studentId
     * @return student
     * @throws IOException
     */
    public Student loadStudentData(String studentId) throws IOException {
        loadFile();
        Student student = new Student();
        for (int i = 0; i < this.sheet.getPhysicalNumberOfRows(); i++) {
            if (fmt.formatCellValue(this.sheet.getRow(i).getCell(0)).equals(studentId)) {
                student.setNumber(fmt.formatCellValue(this.sheet.getRow(i).getCell(0)));
                student.setId(fmt.formatCellValue(this.sheet.getRow(i).getCell(1)));
                student.setName(fmt.formatCellValue(this.sheet.getRow(i).getCell(2)));
                student.setGrade(fmt.formatCellValue(this.sheet.getRow(i).getCell(3)));
                break;
            }
        }

        return student;
    }

    /**
     * Save the changes in the file
     * @throws IOException
     */
    private void saveChanges() throws IOException {
        System.out.println(FULL_FILE_PATH);
        FileOutputStream out = new FileOutputStream(FULL_FILE_PATH);
        this.workbook.write(out);
        out.close();
        this.workbook.close();
    }

    /**
     * Load the current file
     * @throws IOException
     */
    private void loadFile() throws IOException {
        FileInputStream file = new FileInputStream(FULL_FILE_PATH);
        this.workbook = new XSSFWorkbook(file);
        this.sheet = this.workbook.getSheetAt(0);
    }


    public String generateTableData() throws IOException {
        loadFile();

        String tableRow = "";
        for (int i = 0; i < this.sheet.getPhysicalNumberOfRows(); i++) {
            tableRow += "<tr>";
            tableRow += "<td>" + fmt.formatCellValue(this.sheet.getRow(i).getCell(0)) + "</td>";
            tableRow += "<td>" + fmt.formatCellValue(this.sheet.getRow(i).getCell(1)) + "</td>";
            tableRow += "<td>" + fmt.formatCellValue(this.sheet.getRow(i).getCell(2)) + "</td>";
            tableRow += "<td>" + fmt.formatCellValue(this.sheet.getRow(i).getCell(3)) + "</td>";
            tableRow += "<td> <a href='/run/editar.jsp?id=" + fmt.formatCellValue(this.sheet.getRow(i).getCell(0)) + "'>Editar</a></td>";
            tableRow += "</tr>";
        }
        return tableRow;
    }

}
