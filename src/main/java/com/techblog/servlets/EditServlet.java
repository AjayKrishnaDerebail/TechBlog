package com.techblog.servlets;

import com.techblog.entities.User;
import com.techblog.repositories.ConnectionProvider;
import com.techblog.repositories.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

@MultipartConfig
public class EditServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String name = request.getParameter("userName");
        String email = request.getParameter("userEmail");
        String password = request.getParameter("userPassword");
        String gender = request.getParameter("userGender");
        String about = request.getParameter("userAbout");

        Part part = request.getPart("userProfileImage");
        String imageName = part.getSubmittedFileName();

        //Get the user from the session
        User user = (User) request.getSession().getAttribute("currentUser");

        user.setUsername(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setGender(gender);
        user.setAbout(about);

        if (Objects.nonNull(imageName)) {
            user.setProfileImage(imageName);
        }

        //Save in database
        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        boolean result = userDao.updateUser(user);

        if(result){
            out.println("Update success");
        }else{
            out.println("Update failure");
        }
    }
}
