package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Message;
import com.entities.ToDo;
import com.helper.FactoryProvider;

public class AddToDo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {

			String title = req.getParameter("title");
			String task = req.getParameter("task");
			String status = req.getParameter("status");

			ToDo todo = new ToDo(title, task, status);

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();

			s.save(todo);

			tx.commit();
			s.close();

			HttpSession session = req.getSession();
			if (todo != null) {
				Message msg = new Message("task added successfully...", "alert-success");
				session.setAttribute("msg", msg);
				res.sendRedirect("index.jsp");
			}else {
				Message msg = new Message("Oops! Something went wrong...", "alert-danger");
				session.setAttribute("msg", msg);
				res.sendRedirect("add_todo.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
