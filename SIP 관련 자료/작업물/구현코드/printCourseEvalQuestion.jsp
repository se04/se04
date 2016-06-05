<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <title>$Title$</title>
</head>
<body>
<%
    public void printCourseEvalQuestion (ResultSet result)
    {
        int questionCode;
        int evalTarget;
        Date expirationStartDate;
        Date expiratonEndDate;
        String questionInfo;
        String exampleInfo;

        while ( result.next() )
        {
            questionCode = result.getInt("questionCode");
            evalTarget = result.getInt("evalTarget");
            expirationStartDate = result.getDate("expirationStartDate");
            expiratonEndDate = result.getDate("expirationEndDate");
            questionInfo = result.getString("questionInfo");
            exampleInfo = result.getString("exampleInfo");

            out.println(
                    "<tr>" +
                            "<td width='80px'>" + questionCode + "</td>" +
                            "<td width='90px'>" + evalTarget + "</td>" +
                            "<td width='100px'>" + expirationStartDate + "</td>" +
                            "<td width='100px'>" + expiratonEndDate + "</td>" +
                            "<td>" + questionInfo + "</td>" +
                            "<td width='80px'>" + exampleInfo + "</td>" +
                    "</tr>"
            )
        }
    }
%>
</body>
</html>
