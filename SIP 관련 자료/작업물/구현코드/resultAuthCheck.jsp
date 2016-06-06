<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <title>$Title$</title>
</head>
<body>
<%
    // 권한 체크에서 결과값을 true,false로 리턴하지말고 flag 값을 하나 만들어
    // 권한이 있으면 flag = 1; 없으면 flag=0; 으로 가정합니다
    // 밑의 함수는 위의 사항을 가정하고 현재 return 위치에 넣으면 됨
    // ex) 권한이 없을경우
    // flag=0; resultAuthCheck(flag);

    public void resultAuthCheck (int result)
    {
        if(result == 0) // 권한 없음
	{
	    out.print("권한이 없습니다.");
	}
    }
%>
</body>
</html>
