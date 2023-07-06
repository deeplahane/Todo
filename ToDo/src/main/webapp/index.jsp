<%@page import="com.entities.Message"%>
<%@page import="javax.persistence.TypedQuery"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.ToDo"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="all_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home</title>
</head>
<body style="background-color: #f2f3f5;">
	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>
	<div class="container">
		<div class="text-center mt-4 mb-4" style="color: #54626F;">
			<h3>All Todo's</h3>
		</div>
		<table class="table" style="background-color: white">
			<thead style="background-color: #dcdcdc;">
				<tr style="color: #3E424B;">
					<th scope="col" style="width: 300px;">Title</th>
					<th scope="col" style="width: 650px;">Content</th>
					<th scope="col" style="width: 100px;">Status</th>
					<th scope="col" style="width: 150px;">Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				Session s = FactoryProvider.getFactory().openSession();
				@SuppressWarnings("unchecked")
				TypedQuery<ToDo> q = s.createQuery("from ToDo order by id desc");
				List<ToDo> todo = q.getResultList();

				for (ToDo t : todo) {
				%>
				<tr>
					<th scope="row"><%=t.getTitle()%></th>
					<td><%=t.getTodo()%></td>
					<td><%=t.getStatus()%></td>
					<td><a class="btn-sm btn-primary mr-2 "
						style="text-decoration: none;" href="edit_todo.jsp?id=<%=t.getId() %>" role="button">Edit</a><a
						class="btn-sm btn-danger" style="text-decoration: none;" href="delete?id=<%=t.getId() %>" 
						role="button">Delete</a></td>
				</tr>
				<%
				}
				s.close();
				%>

			</tbody>
		</table>
	</div>
</body>
</html>