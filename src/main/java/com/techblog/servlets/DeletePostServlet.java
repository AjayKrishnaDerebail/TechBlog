package com.techblog.servlets;

import com.techblog.repositories.PostDao;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@MultipartConfig
public class DeletePostServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        try{
            int postId = Integer.parseInt(request.getParameter("postId"));
            PostDao postDao = new PostDao();
            if (postDao.deletePostByPostId(postId)) {
                System.out.println("Done");
            }else{
                System.out.println("Error While Deleting Post");
            }
            response.setContentType("application/json");
            response.getWriter().write("{\"redirect\":\"" + request.getContextPath() + "/templates/profile.jsp\"}");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
