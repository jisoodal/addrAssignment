<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="java.util.*, addrAssignment.addrbook.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />

<script type="text/javascript">
   function check(ab_id) {
      document.location.href="addrbook_control.jsp?action=edit&ab_id="+ab_id;
   }
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록:목록화면</title>

</head>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" /> 

<body>
<div align="center"> 
<H2>주소록:목록화면</H2>
<HR>
<form>
<a href="addrbook_form.jsp">주소록 등록</a><P>

      <table border="1">
         <tr><th>번호</th><th>이 름</th><th>전화번호</th><th>생일</th><th>회사</th><th>메모</th></tr>
         <%
         for(AddrBook ab : (ArrayList<AddrBook>)datas) {  //datas에 뭐가 있으면 계속 끄집어냄
         %>
           <tr>
            <td><a href="javascript:check(<%=ab.getAb_id()%>)"><%=ab.getAb_id() %></a></td>
            <td><%=ab.getAb_name() %></td> <!-- %안에 있는건 system.out.print에 해당되므로 ; 필요없음 -->
            <td><%=ab.getAb_tel() %></td>
            <td><%=ab.getAb_birth() %></td>
            <td><%=ab.getAb_comdept() %></td>
            <td><%=ab.getAb_memo() %></td>
           </tr>
          <%
            }
          %>
      </table>
</form>

</div>
</body>
</html>