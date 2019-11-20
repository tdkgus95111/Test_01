<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dbpkg.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert.jsp</title>
<link rel="stylesheet" href="css.css?ver=1" type="text/css">
<script type="text/javascript">
	function check() {
		if (frm.custname.value == "") {
			alert("회원성명이 입력되지않았습니다!!");
			frm.custname.focus();
			return false;
		}
		if (frm.phone.value == "") {
			alert("회원 전화번호 입력하세요");
			frm.phone.foucus();
			return false;
		}
		if (frm.address.value == "") {
			alert("회원 주소 입력하세요");
			frm.address.foucus();
			return false;
		}
		if (frm.joindate.value == "") {
			alert("회원 가입일자 입력하세요")
			frm.joindate.foucus();
			return false;
		}
		if (frm.grade.value == "") {
			alert("회원 등급 입력하세요");
			frm.grade.foucus();
			return false;
		} else if (!(frm.grade.value == "A" || frm.grade.value == "B" || frm.grade.value == "C")) {
			alert("회원등급이 옳바르지 않았습니다.(A,B,C)");
			frm.grade.focus();
			return false;
		}
		if (frm.city.value == "") {
			alert("도시코드 입력 하세요");
			return false;
		} else if (frm.city.value.length > 2) {
			alert("도시코드는 2자리까지 입력가능합니다.");
			frm.city.focus();
			return false;
		}
		alert("sss");
		document.frm.method = "post";
		document.frm.action = "insertPro.jsp";
		document.frm.submit();
	}
</script>
</head>
<body>
	<%
		ShopDAO dao = ShopDAO.getInstance();
			int custno = dao.getCustno();

			Date nowTime = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
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
		<form action="insertPro.jsp" method="post" name="frm">
			<table border="1">
				<tr>
					<th>회원번호(자동생성)</th>
					<td><input type="text" name="custno" id="custno"
						value="<%=custno%>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" id="custname"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" id="phone"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" id="address"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" id="joindate"
						value="<%=sf.format(nowTime)%>"></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td><input type="text" name="grade" id="grade"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" id="city"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등 록" name="btnsubmit" 
						onclick="check()">&nbsp; 
						<input type="button" value="조 회" name="btnlist"
						onclick="location.href='memberList.jsp'">&nbsp;
						<input type="reset" value="재입력" onclick="frm.custname.focus()">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer> HRDKOREA Copyright&copy;2016 All </footer>

</body>
</html>