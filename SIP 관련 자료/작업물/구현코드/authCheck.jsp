<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

function authCheck() 
{
	<%
	int userCode = 사용자 회원코드;
	
	Connection con = null;
   	Statement stmt = null;
   	String driverName = "com.mysql.jdbc.Driver";
   	String dbURL = "jdbc:mysql://localhost/db";
   	int isTrue =1;
   	try {	
		Class.forName(driverName);
		con = DriverManager.getConnection(dbURL, "root", "1111");
		stmt = con.createStatement();

		String sql = "Select aurthority from User where code = " + "userCode";	
		// User : 회원정보DB, aurthority : 회원정보 DB에 존재하는 권한 정보(일반회원, 관리자)라고 가정.
		
		ResultSet rs = st.executeQuery(sql);
	
		String authInfo;

		if( rs.next() )
		{	// 검색된 결과가 존재하면 true
			authInfo = rs.getString("aurthority");
		}

		if ( aurthInfo == 관리자 ) {
			return true;
		}
  		else {
    		return false;
  		}
   	}
	catch( Exception e )	{
		return false;
	}
	%>
}

</body>
</html>