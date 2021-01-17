<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
String name=request.getParameter("name");
String password=request.getParameter("pass");
if((name==null||name.trim().length()==0)||((password==null||password.trim().length()==0))){
	out.println("empty");

}

else{
try{

 Thread.sleep(2000);
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");

  String q="select * from project";
  
   Statement statement=connection.createStatement();
   ResultSet rs=statement.executeQuery(q);
   int var=0;
   while(rs.next()){
   if(rs.getString(1).equals(name)&&rs.getString(2).equals(password)){
    var=1;
   }
}
if(var==1){

ArrayList<String> names = new ArrayList<String>();
names.add(name);
names.add(password);

HttpSession se = request.getSession(true);
se.setAttribute("names",names);
  out.println("success");

}
else
out.println("wrong pass");

}
catch(Exception e){
    out.println(e);
}

}
%>
