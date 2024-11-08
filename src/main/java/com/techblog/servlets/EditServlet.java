package com.techblog.servlets;

import com.techblog.entities.Message;
import com.techblog.entities.User;
import com.techblog.helpers.ProfileImageUploadHelper;
import com.techblog.repositories.ConnectionProvider;
import com.techblog.repositories.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
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
        String oldFile = "";
        if (Objects.nonNull(imageName)) {
            oldFile = user.getProfileImage();
            user.setProfileImage(imageName);
        }

        //Save in database
        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        boolean result = userDao.updateUser(user);

        HttpSession session = request.getSession();
        if(result){
            out.println("Update success");
            String realPath = request.getServletContext().getRealPath("/")
              + "images"
              + File.separator
              + user.getProfileImage();
            String oldFilePath = request.getServletContext().getRealPath("/")
                    + "images"
                    + File.separator
                    + oldFile;
            if (!oldFile.equals("profile.png")) {
                ProfileImageUploadHelper.deleteFile(oldFilePath);
            }
            ProfileImageUploadHelper.saveFile(part.getInputStream(), realPath, out);
            Message message = new Message("Profile Updated","success","alert alert-success");
            session.setAttribute("message",message);
        } else {
            out.println("Update failure");
            Message message = new Message("Profile Update Failed","error","alert alert-danger");
            session.setAttribute("message",message);
        }
        response.sendRedirect(request.getContextPath() + "/templates/profile.jsp");
    }
}
