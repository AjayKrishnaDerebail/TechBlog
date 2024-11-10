package com.techblog.servlets;

import com.techblog.entities.Post;
import com.techblog.entities.User;
import com.techblog.helpers.ProfileImageUploadHelper;
import com.techblog.repositories.PostDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        String postTitle = request.getParameter("postTitle");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String postContent = request.getParameter("postContent");
        String postCode = request.getParameter("postCode");
        Part file = request.getPart("postFile");
        int userId;

        try(PrintWriter out= response.getWriter()){

            if(request.getSession().getAttribute("currentUser") != null) {
                userId = ((User)request.getSession().getAttribute("currentUser")).getId();
            }else{
                userId = 1;
            }

            Post post = new Post(postTitle,postContent,postCode,file.getName(),null,categoryId,userId);

            PostDao postDao = new PostDao();
            if(postDao.savePost(post)){
                String oldFilePath = request.getServletContext().getRealPath("/")
                        + "images"
                        + File.separator
                        + file.getSubmittedFileName();
                ProfileImageUploadHelper.saveFile(file.getInputStream(),oldFilePath);
                out.println("Done");
            }
        }
    }
}
