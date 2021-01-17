<%@ page import="java.sql.*"%>
<%
String name=request.getParameter("name");
String password=request.getParameter("pass");


try{

 Thread.sleep(2000);
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
    String r="select * from project";
    Statement statement=connection.createStatement();
   ResultSet rs=statement.executeQuery(r);
   int var=0;
   while(rs.next()){
   if(rs.getString(1).equals(name)){
    var=1;
   }
}
if(var==1){
	out.println("register");
}
  else{
  String q="insert into project(name,password) values(?,?)";
  
   PreparedStatement stmt=connection.prepareStatement(q);
   stmt.setString(1,name);
   stmt.setString(2,password);

   stmt.executeUpdate();  

    out.println("success");
}
}
catch(Exception e){
    out.println(e);
}


%>
