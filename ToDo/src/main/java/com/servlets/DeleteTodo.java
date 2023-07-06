package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Message;
import com.entities.ToDo;
import com.helper.FactoryProvider;

public class DeleteTodo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			Query q=s.createQuery("delete ToDo where id=:i");
			q.setParameter("i", id);
			int r=q.executeUpdate();

			tx.commit();
			s.close();

			HttpSession session = req.getSession();
			if (r==1) {
				Message msg = new Message("Task deleted successfully...", "alert-success");
				session.setAttribute("msg", msg);
				res.sendRedirect("index.jsp");
			}else {
				Message msg = new Message("Oops! Something went wrong...", "alert-danger");
				session.setAttribute("msg", msg);
				res.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
