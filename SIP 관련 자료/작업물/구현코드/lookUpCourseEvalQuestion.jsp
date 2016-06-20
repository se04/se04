<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
	public ResultSet lookUpCourseEvalQuestion(String inputInfo)
	{
		Connection con = null;
   		Statement stmt = null;
  	 	String driverName = "com.mysql.jdbc.Driver";
   		String dbURL = "jdbc:mysql://kumoh.info:3306/sogong";
		int inputLen = inputInfo.length();   		
   	 
		try{
			Class.forName(driverName);	
			con = DriverManager.getConnection(dbURL,"sogongRoot","sogong");
			stmt = con.createStatement();
			String sql = "Select 질문코드, 평가대상구분, 유효기간시작, 유효기간종료, 질문정보, 답안정보  from CourseEvalQuestion where ";
			for(int i = 0; i < inputLen; i++)
			{
				if(i == 0)
				{
					sql = sql + "질문코드 =";
				}
				else if(i == 1)
				{
					sql = sql + "평가대상구분 =";
				}
				else if(i == 2)
				{
					sql = sql + "유효기간시작=";
				}
				else if(i == 3)
				{
					sql = sql + "유효기간종료=";
				}
				else if(i == 4)
				{
					sql = sql + "질문정보=";
				}
				else if(i == 5)
				{
					sql = sql + "답안정보 =";
				}
				sql = sql + inputinfo[i];
			}
			
			ResultSet rs = st.executeQuery(sql);
			return rs;
		}
		catch(Exception e){
			%>
			alert("DB 접근 중 문제 발생");
			<%!
		}
	}
%>
</body>
</html>