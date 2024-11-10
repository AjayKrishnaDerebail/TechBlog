package com.techblog.repositories;

import com.techblog.entities.Category;
import com.techblog.entities.Post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class PostDao {

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> categories = new ArrayList<>();
        try{
            @SuppressWarnings("SqlNoDataSourceInspection")
            String q = "select * from categories order by categoryName";
            try (Statement statement = ConnectionProvider.getConnection().createStatement()) {
                ResultSet set = statement.executeQuery(q);
                while(set.next()){
                    int catId = set.getInt("categoryId");
                    String catName = set.getString("categoryName");
                    String catDescription = set.getString("description");
                    Category category = new Category(catId,catName,catDescription);
                    categories.add(category);
                }
            }
        } catch (Exception e){
            //noinspection CallToPrintStackTrace
            e.printStackTrace();
        }
        return categories;
    }


    public boolean savePost(Post post) {
        boolean f = false;
        try {
            @SuppressWarnings("SqlNoDataSourceInspection")
            String q = "insert into post(postTitle,postContent,postCode,postPic,categoryId,userId) values(?,?,?,?,?,?)";
            try (PreparedStatement statement = ConnectionProvider.getConnection().prepareStatement(q)) {
                statement.setString(1, post.getPostTitle());
                statement.setString(2, post.getPostContent());
                statement.setString(3, post.getPostCode());
                statement.setString(4, post.getPostPic());
                statement.setInt(5, post.getCategoryId());
                statement.setInt(6, post.getUserId());
                statement.executeUpdate();
                f = true;
            }
        } catch (Exception e) {
            //noinspection CallToPrintStackTrace
            e.printStackTrace();
        }
        return f;
    }

    public void getAllPosts(){

    }

}
