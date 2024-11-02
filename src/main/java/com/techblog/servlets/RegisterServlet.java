package com.techblog.servlets;

import com.techblog.entities.User;
import com.techblog.repositories.ConnectionProvider;
import com.techblog.repositories.UserDao;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        String check = request.getParameter("userCheck");

        if (Objects.isNull(check)) {
            out.println("Please tick checkbox");
        }else{
            String name = request.getParameter("userName");
            String password = request.getParameter("userPassword");
            String email = request.getParameter("userEmail");
            String gender = request.getParameter("userGender");
            String about = request.getParameter("userAbout");

            User user = new User(name,email,password,gender,about);

            boolean insertPass;

            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            insertPass=userDao.saveUser(user);

            if(insertPass){
                out.println("success");
            }else{
                out.println("failure");
            }
        }
    }
}
