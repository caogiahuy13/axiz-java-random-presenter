<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public String random(String[] names) {
		int index = (int) (Math.random() * names.length);
		return names[index];
	}
%>
<%
	request.setCharacterEncoding("UTF-8");
	String[] names = {"フィ", "木村", "輿水", "綿貫", "森"};
	String name = "";

	String btn = request.getParameter("btn");

	if (btn!=null && btn.equals("random")) {
		name = random(names);
	}

	String tableData = "";
	for (int i=0; i<names.length; i++) {
		tableData += String.format("<tr><td>%d</td><td>%s</td></tr>", i+1, names[i]);
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
		}
		.center {
		    text-align: center;
		}
	</style>
</head>
<body>
	<table>
	  <tr>
	    <th></th>
	    <th>名前</th>
	  </tr>
	  <%= tableData %>
	</table>

	<form action="random.jsp" method="post">
      <button type="submit" name="btn" value="random">ランダム</button>
    </form>

	<%= name %>
</body>
</html>