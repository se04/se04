<%@ 
page  contentType="text/html;charset=euc-kr" 
           import="java.sql.DriverManager,
                   java.sql.Connection,
                   java.sql.Statement,
                   java.sql.ResultSet,
                   java.sql.SQLException,
                   java.util.*,
                   java.text.*"%>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<%
 request.setCharacterEncoding("utf-8");  //Set encoding
 
 String questionCode = request.getParameter("questionCode");            
 String evalTarget = request.getParameter("evalTarget");
 
 String date1 = request.getParameter("expirationDateStart");
 String date2 = request.getParameter("expirationDateEnd");
 
 String questionInfo = request.getParameter("questionInfo");
 String exampleInfo = request.getParameter("exampleInfo");
 String inputSum1 = "NULL";
 ResultSet rs   = null;
 
 
 try{
  Class.forName("com.mysql.jdbc.Driver");
  String url = "jdbc:mysql://localhost:3306/courseevalquestiontable?useUnicode=true&characterEncoding=utf-8";
  Connection con = DriverManager.getConnection(url,"root","1234");
  Statement stat = con.createStatement();

  String sql = "Select * from info where ";
		  if(questionCode != "0")
		  {
		 	 inputSum1 = "�����ڵ�='"+questionCode+"'";
		  }
		  if(evalTarget != "0")
		  {
			  if("chk1".equals(evalTarget))
			  {
				  inputSum1 ="�򰡴�󱸺�='����'";
			  }
			  else if("chk2".equals(evalTarget))
			  {
				 inputSum1 ="�򰡴�󱸺�='����'";
			  }
		  }
		  
		  if(date1 != "0")
		  {
		 	 inputSum1 = "��ȿ�Ⱓ����='"+date1+"'"+"AND ��ȿ�Ⱓ����='"+date2+"'";
		 	
		  }
		  
		  if(questionInfo != null)
		  {
		 	 inputSum1 = "��������='"+questionInfo+"'";
		  }
		  
		  if(exampleInfo != "0")
		  {
			  if("chk1".equals(exampleInfo))
			  {
				  inputSum1 ="�������='�ְ���'";
			  }
			  else if("chk2".equals(exampleInfo))
			  {
				 inputSum1 ="�������='������'";
			  }
		  }
		  sql = sql + inputSum1;
		  rs = stat.executeQuery(sql);
		  
 }
 catch(SQLException e){
  out.println( e );
 }

out.println("<table border=\"1\">");
out.println("<tr bgcolor=B5ADAD>");
out.println("<td width=\"80px\">���� �ڵ�</td><td width=\"90px\">�� ��� ����</td>");
out.println("<td width=\"100px\">��ȿ�Ⱓ ������</td><td width=\"100px\">��ȿ�Ⱓ ������</td>");
out.println("<td>���� ����</td><td width=\"80px\">��� ����</td>"); 
out.println("</tr>"); 

 while ( rs.next() )
 {
	 out.println(rs.getString("��ȿ�Ⱓ����"));
	 out.println("<tr>");
	 out.println("<td width=\"80px\">"+rs.getString("�����ڵ�")+"</td>");
	 out.println("<td width=\"90px\">"+rs.getString("�򰡴�󱸺�")+"</td>");
	 out.println("<td width=\"100px\">"+rs.getString("��ȿ�Ⱓ����")+"</td>");
	 out.println("<td width=\"100px\">"+rs.getString("��ȿ�Ⱓ����")+"</td>");
	 out.println("<td>"+rs.getString("��������")+"</td>");
	 out.println("<td width=\"80px\">"+rs.getString("�������")+"</td>");
 }
out.println("</table>");
%>