<%@ page  contentType="text/html;charset=euc-kr" 
        import="java.sql.DriverManager,
                   java.sql.Connection,
                   java.sql.Statement,
                   java.sql.ResultSet,
                   java.sql.SQLException" %>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<%
    request.setCharacterEncoding("utf-8");    // 인코딩 방식을 설정
    String userCode = request.getParameter("userCode");    // userCode를 가져옴
    String inputSum = "NULL";    
    ResultSet rs   = null;
 
    try
    {
        // DB에 접속
        Class.forName("com.mysql.jdbc.Driver");
        String dbURL = "jdbc:mysql://kumoh.info:3306/sogong";
        Connection con = DriverManager.getConnection(url,"sogongRoot","sogong");
        Statement stat = con.createStatement();

        // SQL문 작성
        String sql = "Select * from usertable where ";
        if(userCode != "0")
        {
            inputSum = "회원코드='"+userCode+"'";
        }	// End if(userCode != "0")
        sql = sql + inputSum;
        rs = stat.executeQuery(sql);
		  
        if(rs.next())
        {   // 권한 확인        
            String auth = rs.getString("권한");

            if("관리자".equals(auth))
            {
                out.println("<script>alert(\"권한 확인되었습니다.\");</script>");
            }	// End if("관리자".equals(auth))
            else if("일반".equals(auth))
            {
                out.println("<script>alert(\"권한이 없습니다.\");</script>");
                out.println("<script>top.document.location.reload();</script> ");
            }	// End else if("일반".equals(auth))
        }	// End if(rs.next())
    }	// End try
    catch(SQLException e)
    {
        out.println( e );
    }	// End catch

%>
