<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	String btn = request.getParameter("btn");

	String name = "";
	Data data = new Data();
	Student[] students = data.getStudents();
	boolean isShowingName = false;

	if (btn!=null && btn.equals("random")) {
		int index = (int) (Math.random() * students.length);
		name = students[index].getName();
		isShowingName = true;
	}

	if (btn!=null && btn.equals("do")) {
		data.speech(new Student(request.getParameter("name")));
		isShowingName = false;
	}

	if (btn!=null && btn.equals("pass")) {
		data.pass(new Student(request.getParameter("name")));

		int index = (int) (Math.random() * students.length);
		name = students[index].getName();
		isShowingName = true;
	}


	String tableData = "";
	for (int i=0; i<students.length; i++) {
		tableData += String.format("<tr><td>%d</td><td><a href=\"student.jsp?id=%d\">%s</a></td><td>%d</td><td>%d</td></tr>",
				i+1,
				i,
				students[i].getName(),
				students[i].getSpeeches().size(),
				students[i].getPasses().size());
	}

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
			font-size: 18px;
			padding: 4px;
		}
		.center {
		    text-align: center;
		}
		button {
			font-size: 18px;
		}
	</style>
</head>
<body>
	<table>
	  <tr>
	    <th></th>
	    <th>名前</th>
	    <th>実施回</th>
	    <th>パス回</th>
	  </tr>
	  <%= tableData %>
	</table>
	<br>

	<form action="random.jsp" method="post">
		<button type="submit" name="btn" value="random">ランダム</button>
    </form>
	<br>

	<h1><%= name %></h1>
	<form action="random.jsp" method="post">
		<input type="hidden" id="name" name="name" value="<%= name %>">
		<%
			if (isShowingName) {
				out.println("<button type=\"hidden\" name=\"btn\" value=\"do\">実施</button>");
				out.println("<button type=\"hidden\" name=\"btn\" value=\"pass\">パス</button>");
			} else {
				out.println("<button style=\"display: none;\" type=\"hidden\" name=\"btn\" value=\"do\">実施</button>");
				out.println("<button style=\"display: none;\" type=\"hidden\" name=\"btn\" value=\"pass\">パス</button>");
			}
		%>
    </form>
</body>
</html>