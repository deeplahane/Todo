<%@page import="java.util.List"%>
<%@page import="com.entities.ToDo"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="all_css.jsp"%>
<meta charset="ISO-8859-1">
<title>Edit Task</title>

</head>
<body style="background-color: #f0f1f2">

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
	<!-- main body start -->

	<div class="container mt-4 ">
		<div class="row p-5">
			<div class="col-md-6 offset-md-3">
				<div class="card ">
					<div class="card-head text-center mt-4">
						<h2 class="text-secondary">
							<i class="fa-solid fa-pen-to-square"></i> Edit Task
						</h2>
					</div>
					<div class="card-body">
						<form action="update" method="post">
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						Session s=FactoryProvider.getFactory().openSession();
						ToDo t=s.get(ToDo.class,id);
					    s.close();
					%>
					<input  type="hidden" name="id" value="<%=t.getId() %>" />
							<div class="form-group">
							
								<label for="input1">Title</label> <input type="text"
									class="form-control" id="input1" placeholder="Do workout"
									name="title" value="<%=t.getTitle() %>" required>

							</div>
							<div class="form-group">
								<label for="input">Task</label> <input type="text"
									class="form-control" id="input" placeholder="Go to gym"
									name="task" value="<%=t.getTodo() %>" required>

							</div>
							<div class="form-group">
								<label for="inputState">Status</label> <select
									class="form-control" id="inputState" name="status" required>
									<option selected value="<%=t.getStatus() %>">---Select---</option>
									<option value="Pending">Pending</option>
									<option value="Complete">Complete</option>
								</select>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Save</button>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- main body end -->
</body>
</html>