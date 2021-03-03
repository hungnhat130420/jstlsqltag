<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giảng viên - đề tài</title>
</head>
<body>
	<sql:setDataSource var="snapshot" user="sa" password="123" 
	driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
	url="jdbc:sqlserver://localhost:1433;databaseName=QuanLyGiangVienDeTai"/>
	<sql:query var="result" dataSource="${snapshot }">
		SELECT * FROM GIANGVIEN;
	</sql:query>
	<table border="1" width="100%">
		<tr>
			<th>Faculty ID</th>
			<th>Full Name</th>
			<th>Research Area</th>
			<th>Telephone Number</th>
			<c:forEach var="row" items="${result.rows }">
					<tr>
						<td><c:out value="${row.MaGV }"/></td>
						<td><c:out value="${row.TENGV }"/> <br/>
							<u><i>Danh sách đề tài :</i></u>
							<sql:query dataSource="${snapshot }" var="detaigv">
								SELECT * FROM DETAI WHERE MAGV=?;
								<sql:param value="${row.MaGV }"/>
							</sql:query>
						<ul>
							<c:forEach var="rowdt" items="${detaigv.rows }">
								<li><c:out value="${rowdt.TENDT }"/></li>	
							</c:forEach>
						</ul>
						</td>
						<td><c:out value="${row.LINHVUCNGHIENCUU }"/></td>
						<td><c:out value="${row.SODIENTHOAi }"/></td>
					</tr>
			</c:forEach>
			
		</tr>
	</table>
</body>
</html>