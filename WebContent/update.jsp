<%@page import="dbpkg.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css.css?var=1" type="text/css">
<script>
function check() {
	if (frm.custname.value=="") {
		alert("회원성명 입력하세요!!")
		frm.custname.focus();
		return false;
	}
	if (frm.phone.value=="") {
		alert("회원번호 입력하세요!!")
		frm.phone.focus();
		return false;
	}
	if (frm.address.value=="") {
		alert("회원주소 입력하세요!!")
		frm.address.focus();
		return false;
	}
	if (frm.joindate.value=="") {
		alert("회원주소 입력하세요!!");
		frm.joindate.focus();
		return false;
	}
	if (frm.grade.value=="") {
		alert("등급 입력하세요!!");
		frm.grade.focus();
		return false;
	} else if ( !(frm.grade.value=="A" || frm.grade.value=="B" || frm.grade.value=="C")){
		alert("A, B ,C 를 입력하세요!!");
		frm.grade.focus();
		return false;
	}
	if (frm.city.value=="") {
		alert("도시코드 입력하세요!!");
		frm.city.focus();
		return false;
	} else if(frm.city.value.length>2){
		alert("도시코드는 2자리까지 입력하세요!!");
		frm.city.focus();
		return false;
	}
	document.frm.method="post";
	document.frm.action="updatePro.jsp";
	document.frm.submit();	
}
</script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
String custno = request.getParameter("custno");
ShopDAO mem_dao = ShopDAO.getInstance();
MemberVO vo = mem_dao.getMem(Integer.parseInt(custno));
%>
	<header>
		<h1>쇼핑몰 회원관리 ver1.0</h1>
	</header>
	<nav>
		<ul>
			<li><a href="insert.jsp">회원등록</a></li>
			<li><a href="memberList.jsp">회원목록조회/수정</a></li>
			<li><a href="priceList.jsp">회원매출조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	<section>
		<h2>쇼핑몰회원관리 프로그램</h2>
		<form name="frm">
			<table border="1">
				<tr>
					<th>회원번호</th>
					<td>
						<input type="text" name="custno" id="custno" value="<%= vo.getCustno() %>" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td>
						<input type="text" name="custname" id="custname"
						value="<%= vo.getCustname() %>">
					</td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td>
						<input type="text" name="phone" id="phone"
						value="<%= vo.getPhone() %>">
					</td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td>
						<input type="text" name="address" id="address"
						value="<%= vo.getAddress() %>">
					</td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td>
						<input type="text" name="joindate" id="joindate"
						value="<%= vo.getJoindate() %>">
					</td>
				</tr>
				<tr>
					<th>고객등급[a:VIP, B:일반, C:직원]</th>
					<td>
						<input type="text" name="grade" id="grade"
						value="<%= vo.getGrade() %>">
					</td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td>
						<input type="text" name="city" id="city"
						value="<%= vo.getCity() %>">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="수정" name="btnsubmit"
						onclick="check()">&nbsp;
						<input type="button" value="조회" name="btnlist"
						onclick="location.href='memberList.jsp'">
						<input type="reset" value="재입력" name="reset"
						onclick="frm.custnanme.focus()">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		HRDKOREA Copyright&copy;2016 All  
	</footer>
	
</body>
</html>


















