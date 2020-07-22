<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.*"%>
<%@ page import="java.time.format.DateTimeFormatter, java.util.List, java.time.LocalDateTime" %>
<%!
	public String getTableData(List<LocalDateTime> list) {
		String result = "";
		for (int i=0; i<list.size(); i++) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			String formattedDateTime = list.get(i).format(formatter);
			result += String.format("<tr><td>%d</td><td>%s</td></tr>", i+1, formattedDateTime);
		}
		return result;
	}
%>
<%
	Data data = new Data();

	String idStr = request.getParameter("id");
	int id = idStr != null ? Integer.parseInt(idStr) : 0;
	Student student = data.getStudents()[id];

	String name = student.getName();
	String speechesData = getTableData(student.getSpeeches());
	String passesData = getTableData(student.getPasses());
	int speechTimes = student.getSpeeches().size();
	int passTimes = student.getPasses().size();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		table {
		    border-collapse: collapse;
		}
		table th, table td {
		    border: solid 1px black;
		    padding: 4px;
		}
		.center {
		    text-align: center;
		}
	</style>
</head>
<body>
	<h1><%= name %></h1>

	<h3>実施</h3>
	<table>
	  <tr>
	    <th></th>
	    <th>日付</th>
	  </tr>
	  <%= speechesData %>
	  <tr><td colspan="2" style="text-align:center"><%= speechTimes %>回</td></tr>
	</table>

	<h3>パス</h3>
	<table>
	  <tr>
	    <th></th>
	    <th>日付</th>
	  </tr>
	  <%= passesData %>
	  <tr><td colspan="2" style="text-align:center"><%= passTimes %>回</td></tr>
	</table>

	<br>
</body>
</html>