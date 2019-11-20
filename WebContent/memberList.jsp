<%@page import="java.util.ArrayList"%>
<%@page import="dbpkg.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css.css" type="text/css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	ShopDAO mem_dao = ShopDAO.getInstance();
	ArrayList<MemberVO> mList = mem_dao.memList();
%>
	<header>
		<h1>쇼핑몰 회원관리 ver1.0</h1>
	</header>
	<nav>
		<ul>
			<li><a href="insert.jsp">회원등록</a></li>
			<li><a href="memberList.jsp">회원목록조회/수정</a></li>
			<li><a href="priceList.jsp">회원매출조회</a></li>
			<li><a href="index.jsp">홈으로.</a></li>
		</ul>
	</nav>
	<section>
		<h2>쇼핑몰회원관리 프로그램</h2>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<%
				for(MemberVO e : mList) {
			%>
			<tr>
				<td><a href="update.jsp?custno=<%=e.getCustno() %>"><%=e.getCustno() %></a></td>
				<td><%=e.getCustname() %></td>
				<td><%=e.getPhone() %></td>
				<td><%=e.getAddress() %></td>
				<td><%=e.getJoindate() %></td>
				<td><%=e.getGrade() %></td>
				<td><%=e.getCity() %></td>
			</tr>
			<%
				}
			%>
		</table>
	</section>
	<footer>
		HRDKOREA Copyright&copy;2016 All  
	</footer>
	
</body>
</html>