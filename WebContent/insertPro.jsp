
<%@page import="dbpkg.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPro.jsp</title>
<link rel="stylesheet" href="style.css?var=a" type="text/css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
ShopDAO mem_dao = ShopDAO.getInstance();
int custno = Integer.parseInt(request.getParameter("custno"));
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");
MemberVO vo = new MemberVO();
vo.setCustno(custno);
vo.setCustname(custname);
vo.setPhone(phone);
vo.setAddress(address);
vo.setJoindate(joindate);
vo.setGrade(grade);
vo.setCity(city);
int rs = mem_dao.insertMember(vo);
%>
<script type="text/javascript">
	<%if(rs == 1) { %>
		alert("등록 완료!!")
		location.href = "insert.jsp";
	<% } else { %>
		alert("등록 실패!!")
		history.back();
	<% } %>
</script>

</body>
</html>