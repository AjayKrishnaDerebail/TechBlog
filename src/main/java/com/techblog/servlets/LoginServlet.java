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

public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String password = request.getParameter("userPassword");
        String email = request.getParameter("email");

        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        User user = userDao.getUserByEmailAndPassword(email,password);

        if(Objects.isNull(user)){
            //out.println("No such user exists");
            Message message = new Message("Invalid Details","error","alert alert-danger");
            HttpSession session = request.getSession();
            session.setAttribute("message",message);
            response.sendRedirect(request.getContextPath() +"/templates/login.jsp");
        } else{
            HttpSession session = request.getSession();
            session.setAttribute("currentUser" , user);
            response.sendRedirect(request.getContextPath() + "/templates/profile.jsp");
        }


    }
}
