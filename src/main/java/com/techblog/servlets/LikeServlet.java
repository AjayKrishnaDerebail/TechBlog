package com.techblog.servlets;

import com.techblog.repositories.ConnectionProvider;
import com.techblog.repositories.LikeDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class LikeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String operation = request.getParameter("operation");
            int uid = Integer.parseInt(request.getParameter("userId"));
            int pid = Integer.parseInt(request.getParameter("postId"));

            out.println("data from server");
            out.println(operation);
            out.println(uid);
            out.println(pid);
            LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
            if (operation.equals("like")) {
                boolean f=likeDao.insertLike(pid, uid);
                out.println(f);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
