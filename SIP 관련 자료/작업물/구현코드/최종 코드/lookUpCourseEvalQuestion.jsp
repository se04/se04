<%@page  contentType="text/html;charset=utf-8"
         import="java.sql.DriverManager,
                 java.sql.Connection,
                 java.sql.Statement,
                 java.sql.ResultSet,
                 java.sql.SQLException,
                 java.util.*,
                 java.text.*"
%>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<%
    /*
        모듈명 : 강의평가 질문 정보 조회
        작성자 : 이도예
     */
    request.setCharacterEncoding("utf-8");

    //검색정보를 받아옴
    String questionCode = request.getParameter("questionCode");
    String evalTarget = request.getParameter("evalTarget");
    String date1 = request.getParameter("expirationDateStart");
    String date2 = request.getParameter("expirationDateEnd");
    String questionInfo = request.getParameter("questionInfo");
    String exampleInfo = request.getParameter("exampleInfo");

    //변수 초기화
    String inputSum1 = "NULL";
    ResultSet rs   = null;

    //DB 접속 및 조회
    try{
        //DB 접속
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://kumoh.info:3306/sogong";
        Connection con = DriverManager.getConnection(url,"sogongRoot","sogong");
        Statement stat = con.createStatement();

        //강의평가 질문 정보 조회
        String sql = "Select * from info where ";

        //질문코드 조회
        if(questionCode != "0")
        {
            inputSum1 = "질문코드='"+questionCode+"'";
        }

        //평가대상 조회
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

        //유효기간 조회
        if(date1 != "0")
        {
            inputSum1 = "유효기간시작='"+date1+"'"+"AND 유효기간종료='"+date2+"'";

        }

        //질문정보 조회
        if(questionInfo != null)
        {
            inputSum1 = "질문정보='"+questionInfo+"'";
        }

        //답안정보 조회
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

        //쿼리문 작성
        sql = sql + inputSum1;
        rs = stat.executeQuery(sql);

    }
    catch(SQLException e)
    {
        out.println( e );
    }
%>

<%
    /*
        모듈명 : 강의평가 질문 정보 출력
        작성자 : 김종현
    */

    //표 제목 작성
    out.println("<table border=\"1\">");
    out.println("<tr bgcolor=B5ADAD>");
    out.println("<td width=\"80px\">질문 코드</td><td width=\"90px\">평가 대상 구분</td>");
    out.println("<td width=\"100px\">유효기간 시작일</td><td width=\"100px\">유효기간 종료일</td>");
    out.println("<td>질문 정보</td><td width=\"80px\">답안 정보</td>");
    out.println("</tr>");

    //조회 결과 출력
    while ( rs.next() )
    {
        out.println("<tr>");
        out.println("<td width=\"80px\">"+rs.getString("질문코드")+"</td>");
        out.println("<td width=\"90px\">"+rs.getString("평가대상구분")+"</td>");
        out.println("<td width=\"100px\">"+rs.getString("유효기간시작")+"</td>");
        out.println("<td width=\"100px\">"+rs.getString("유효기간종료")+"</td>");
        out.println("<td>"+rs.getString("질문정보")+"</td>");
        out.println("<td width=\"80px\">"+rs.getString("답안정보")+"</td>");
        out.println("</tr>");
    }
    out.println("</table>");
%>