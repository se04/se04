<% //확인 버튼 클릭시 실행 시
pubilc ResultSet readQuestionInfo() {
  Connection conn = 데이터 베이스에 접속;
  Statement state = 데이터 베이스의 상태;
  try {
    query = 해당 정보 삭제 쿼리;
    ResultSet result = 쿼리 실행;
  } catch ( Exception e ) {
    오류 메시지 출력;
  }
  state.close();
  conn.close();

  return result;
}
%>
