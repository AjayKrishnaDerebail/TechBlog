package com.techblog.servlets;

import com.techblog.entities.Message;
import com.techblog.entities.User;
import com.techblog.repositories.ConnectionProvider;
import com.techblog.repositories.UserDao;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

public class LogoutServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.setContentType("text/html");

        HttpSession session = request.getSession();
        session.removeAttribute("currentUser");

        Message message = new Message("Logout Successfully","success","alert alert-success");
        session.setAttribute("message",message);
        response.sendRedirect(request.getContextPath() +"/templates/login.jsp");

    }
}
