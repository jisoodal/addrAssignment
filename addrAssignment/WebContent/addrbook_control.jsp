<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="addrbook_error.jsp" import= "java.util.*"%>
    <%@page import = "addrAssignment.addrbook.*, java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="ab" class="addrAssignment.addrbook.AddrBean"/>
<jsp:useBean id="addrbook" class="addrAssignment.addrbook.AddrBook"/> <!-- 데이터를 집어넣을 용도 -->
<jsp:setProperty name="addrbook" property="*"/>
 
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 주소록 목록 요청인 경우

	if(action.equals("list")) {
		ArrayList<AddrBook> datas= ab.getDBList();
		request.setAttribute("datas", datas); //datas라는 이름으로 넘긴다 리퀘스트라는 곳에서 데이터를 꺼내오면 된다
		pageContext.forward("addrbook_list.jsp"); //여기로 넘겨준다
	}
	// 주소록 등록 요청인 경우
	else if(action.equals("insert")) { //db에 데이터를 집어넣을 것을 ab가 가지고있음
		if(ab.insertDB(addrbook)) {
		response.sendRedirect("addrbook_control.jsp?action=list"); //이렇게 하면 목록이 다시 뿌려짐. insert 성공시 control의 list로 간다
	}
		else{
			throw new Exception("DB 입력 오류!!!");
		}
	}
	// 주소록 수정 페이지 요청인 경우
	else if(action.equals("edit")) {
		AddrBook abook = ab.getDB(addrbook.getAb_id());
		request.setAttribute("ab",abook);
		pageContext.forward("addrbook_edit_form.jsp");
	}
	// 주소록 수정 등록 요청인 경우
	else if(action.equals("update")) {
		if(ab.updateDB(addrbook)) {
			response.sendRedirect("addrbook_control.jsp?action=list");
		}
		else
			throw new Exception("DB 갱신오류");
	}
	// 주소록 삭제 요청인 경우
	else if(action.equals("delete")) {
		if(ab.deleteDB(addrbook.getAb_id())){
		response.sendRedirect("addrbook_control.jsp?action=list");	
		}
		else{
			throw new Exception("DB 삭제 오류!!!");
		}
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>