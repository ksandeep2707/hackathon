import java.io.*;  
import java.sql.*;  
import javax.servlet.ServletException;  
import javax.servlet.http.*; 

import java.io.IOException;  
import java.io.PrintWriter;  
import javax.servlet.ServletException;  
import javax.servlet.http.*; 
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse; 

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
public class UploadServlet extends HttpServlet {

    PrintWriter out = null;
    Connection con = null;
    PreparedStatement ps = null;
    HttpSession session = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
             Thread.sleep(2000);
            out = response.getWriter();
            session = request.getSession(false);
            String folderName = "resources";
            String uploadPath = request.getServletContext().getRealPath("/") + File.separator + folderName;//for netbeans use this code
            //String uploadPath = request.getServletContext().getRealPath("") + folderName;//for eclipse use this code
            File dir = new File(uploadPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            Part filePart = request.getPart("file");
            String category=request.getParameter("category");
            String year=request.getParameter("year");
            String subjectcode = request.getParameter("subjectcode");
            String subjectname = request.getParameter("subjectname");
            String fileName = filePart.getSubmittedFileName();
            String path = uploadPath + File.separator + fileName;
            Timestamp added_date = new Timestamp(System.currentTimeMillis());
            System.out.println("FileName: " +fileName);
            System.out.println("Path: " + uploadPath);
            System.out.println("SubjectCode: " + subjectcode);
            InputStream is = filePart.getInputStream();
           Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

            try {
                 Class.forName("oracle.jdbc.driver.OracleDriver");  
               Connection con=DriverManager.getConnection(  
                  "jdbc:oracle:thin:@localhost:1521:xe","system","manager");
               int status=0;
               if(category.equals("question")){
                String sql = "insert into QuestionTable(year,subjectcode,subjectname,filename,path,added_date) values(?,?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, year);
                ps.setString(2, subjectcode);
                ps.setString(3, subjectname);
                ps.setString(4, fileName);
                ps.setString(5, path);
                ps.setTimestamp(6,added_date);
                 status = ps.executeUpdate();
                 System.out.println("hello");
             }
              if(category.equals("syllabus")){
                String sql = "insert into SyllabusTable(year,subjectcode,subjectname,filename,path,added_date) values(?,?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, year);
                ps.setString(2, subjectcode);
                ps.setString(3, subjectname);
                ps.setString(4, fileName);
                ps.setString(5, path);
                ps.setTimestamp(6,added_date);
                 status = ps.executeUpdate();
             }

                if (status > 0) 
                {
                    
                             InputStream in=filePart.getInputStream();
                             boolean k=uploadFile(in,path,out);
                              if(k){
                             System.out.println("success");
                              out.print("success");
                            
                              
                               out.close();
                               }
                else
                                out.println("wrong");

                }
            } catch(Exception e) {
                out.println("Exception: " + e);
                System.out.println("Exception1: " + e);
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException e) {
                    out.println(e);
                }
            }

        } catch (Exception e) {
            out.println("Exception: " + e);
            System.out.println("Exception2: " + e);
        }
    }



    public boolean uploadFile(InputStream is, String path,PrintWriter out){
        boolean test=false;
        try{
            byte[] buf=new byte[is.available()];
            is.read(buf);
            FileOutputStream ops=new FileOutputStream(path);
            ops.write(buf);
            ops.flush();
            ops.close();
            test=true;

        }
        catch(Exception e){
           out.println(e);
        }
        return test;
    }

}