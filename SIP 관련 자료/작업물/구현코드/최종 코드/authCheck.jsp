<%@ page  contentType="text/html;charset=euc-kr" 
        import="java.sql.DriverManager,
                   java.sql.Connection,
                   java.sql.Statement,
                   java.sql.ResultSet,
                   java.sql.SQLException" %>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<%
 request.setCharacterEncoding("utf-8");  //Set encoding
 String userCode = request.getParameter("userCode");
 String inputSum = "NULL";
 ResultSet rs   = null;
 
 try{
  Class.forName("com.mysql.jdbc.Driver");
  String url = "jdbc:mysql://localhost:3306/courseevalquestiontable?useUnicode=true&characterEncoding=utf-8";
  Connection con = DriverManager.getConnection(url,"root","1234");
  Statement stat = con.createStatement();

  String sql = "Select * from usertable where ";
		  if(userCode != "0")
		  {
		 	 inputSum = "ȸ���ڵ�='"+userCode+"'";
		  }
		  sql = sql + inputSum;
		  rs = stat.executeQuery(sql);
		  
		  if(rs.next())
		  {
		 	 String auth = rs.getString("����");
		 	 if("������".equals(auth))
		 	 {
		 		out.println("<script>alert(\"���� Ȯ�εǾ����ϴ�.\");</script>");
		 	 }
		 	 else if("�Ϲ�".equals(auth))
		 	 {
		 		out.println("<script>alert(\"������ �����ϴ�.\");</script>");
		 		out.println("<script>top.document.location.reload();</script> ");
		 	 }
		  }
 }
 catch(SQLException e){
  out.println( e );
 }

%>
