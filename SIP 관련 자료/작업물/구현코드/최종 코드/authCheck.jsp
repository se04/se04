<%@ page  contentType="text/html;charset=euc-kr" 
        import="java.sql.DriverManager,
                   java.sql.Connection,
                   java.sql.Statement,
                   java.sql.ResultSet,
                   java.sql.SQLException" %>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<%
    request.setCharacterEncoding("utf-8");    // ���ڵ� ����� ����
    String userCode = request.getParameter("userCode");    // userCode�� ������
    String inputSum = "NULL";    
    ResultSet rs   = null;
 
    try
    {
        // DB�� ����
        Class.forName("com.mysql.jdbc.Driver");
        String dbURL = "jdbc:mysql://kumoh.info:3306/sogong";
        Connection con = DriverManager.getConnection(url,"sogongRoot","sogong");
        Statement stat = con.createStatement();

        // SQL�� �ۼ�
        String sql = "Select * from usertable where ";
        if(userCode != "0")
        {
            inputSum = "ȸ���ڵ�='"+userCode+"'";
        }	// End if(userCode != "0")
        sql = sql + inputSum;
        rs = stat.executeQuery(sql);
		  
        if(rs.next())
        {   // ���� Ȯ��        
            String auth = rs.getString("����");

            if("������".equals(auth))
            {
                out.println("<script>alert(\"���� Ȯ�εǾ����ϴ�.\");</script>");
            }	// End if("������".equals(auth))
            else if("�Ϲ�".equals(auth))
            {
                out.println("<script>alert(\"������ �����ϴ�.\");</script>");
                out.println("<script>top.document.location.reload();</script> ");
            }	// End else if("�Ϲ�".equals(auth))
        }	// End if(rs.next())
    }	// End try
    catch(SQLException e)
    {
        out.println( e );
    }	// End catch

%>
