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
		 	 inputSum1 = "질문코드='"+questionCode+"'";
		  }
		  if(evalTarget != "0")
		  {
			  if("chk1".equals(evalTarget))
			  {
				  inputSum1 ="평가대상구분='강사'";
			  }
			  else if("chk2".equals(evalTarget))
			  {
				 inputSum1 ="평가대상구분='과목'";
			  }
		  }
		  
		  if(date1 != "0")
		  {
		 	 inputSum1 = "유효기간시작='"+date1+"'"+"AND 유효기간종료='"+date2+"'";
		 	
		  }
		  
		  if(questionInfo != null)
		  {
		 	 inputSum1 = "질문정보='"+questionInfo+"'";
		  }
		  
		  if(exampleInfo != "0")
		  {
			  if("chk1".equals(exampleInfo))
			  {
				  inputSum1 ="답안정보='주관식'";
			  }
			  else if("chk2".equals(exampleInfo))
			  {
				 inputSum1 ="답안정보='객관식'";
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
out.println("<td width=\"80px\">질문 코드</td><td width=\"90px\">평가 대상 구분</td>");
out.println("<td width=\"100px\">유효기간 시작일</td><td width=\"100px\">유효기간 종료일</td>");
out.println("<td>질문 정보</td><td width=\"80px\">답안 정보</td>"); 
out.println("</tr>"); 

 while ( rs.next() )
 {
	 out.println(rs.getString("유효기간시작"));
	 out.println("<tr>");
	 out.println("<td width=\"80px\">"+rs.getString("질문코드")+"</td>");
	 out.println("<td width=\"90px\">"+rs.getString("평가대상구분")+"</td>");
	 out.println("<td width=\"100px\">"+rs.getString("유효기간시작")+"</td>");
	 out.println("<td width=\"100px\">"+rs.getString("유효기간종료")+"</td>");
	 out.println("<td>"+rs.getString("질문정보")+"</td>");
	 out.println("<td width=\"80px\">"+rs.getString("답안정보")+"</td>");
 }
out.println("</table>");
%>