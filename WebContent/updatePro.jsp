<%@page import="dbpkg.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePro.jsp</title>
<link rel="stylesheet" href="css.css" type="text/css">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		ShopDAO mem_dao = ShopDAO.getInstance();
		MemberVO vo = new MemberVO();
		vo.setCustno(Integer.parseInt(request.getParameter("custno")));
		vo.setCustname(request.getParameter("custname"));
		vo.setPhone(request.getParameter("phone"));
		vo.setAddress(request.getParameter("address"));
		vo.setJoindate(request.getParameter("joindate"));
		vo.setGrade(request.getParameter("grade"));
		vo.setCity(request.getParameter("city"));
		int rs = mem_dao.updateMem(vo);
	%>
	<script type="text/javascript">
	<%if (rs == 1) { %>
		alert("회원정보수정 완료!!")
		location.href = "memberList.jsp";
	<%} else { %>
		alert("회원정보수정 실패!!")
		history.back();
	<% } %>
	</script>
</body>
</html>