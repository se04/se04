<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <title>$Title$</title>
</head>
<body>
<%
    // ���� üũ���� ������� true,false�� ������������ flag ���� �ϳ� �����
    // ������ ������ flag = 1; ������ flag=0; ���� �����մϴ�
    // ���� �Լ��� ���� ������ �����ϰ� ���� return ��ġ�� ������ ��
    // ex) ������ �������
    // flag=0; resultAuthCheck(flag);

    public void resultAuthCheck (int result)
    {
        if(result == 0) // ���� ����
	{
	    out.print("������ �����ϴ�.");
	}
    }
%>
</body>
</html>
