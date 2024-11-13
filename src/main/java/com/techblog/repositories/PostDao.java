package com.techblog.repositories;

import com.techblog.entities.Category;
import com.techblog.entities.Post;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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

    public List<Post> getAllPosts() {
        List<Post> posts = new ArrayList<>();
        try {
            @SuppressWarnings("SqlNoDataSourceInspection")
            String q = "SELECT * FROM post";
            try (Statement statement = ConnectionProvider.getConnection().createStatement()) {
                ResultSet set = statement.executeQuery(q);
                while (set.next()) {
                    int postId = set.getInt("postId");
                    String postTitle = set.getString("postTitle");
                    String postContent = set.getString("postContent");
                    String postCode = set.getString("postCode");
                    String postPic = set.getString("postPic");
                    Timestamp postDate = set.getTimestamp("postDate");
                    int categoryId = set.getInt("categoryId");
                    int userId = set.getInt("userId");

                    Post post = new Post(postId, postTitle, postContent, postCode,
                            postPic, postDate, categoryId, userId);
                    posts.add(post);
                }
            }
        } catch (SQLException e) {
        //noinspection CallToPrintStackTrace
        e.printStackTrace();
        }
        return posts;
    }

    public List<Post> getPostsByCategoryId(int catId) {
        List<Post> posts = new ArrayList<>();
        try {
            @SuppressWarnings("SqlNoDataSourceInspection")
            String q = "SELECT * FROM post where categoryId = ?";
            try (PreparedStatement statement = ConnectionProvider.getConnection().prepareStatement(q)) {
                statement.setInt(1, catId);
                ResultSet set = statement.executeQuery();
                while (set.next()) {
                    int postId = set.getInt("postId");
                    String postTitle = set.getString("postTitle");
                    String postContent = set.getString("postContent");
                    String postCode = set.getString("postCode");
                    String postPic = set.getString("postPic");
                    Timestamp postDate = set.getTimestamp("postDate");
                    int userId = set.getInt("userId");

                    Post post = new Post(postId, postTitle, postContent, postCode,
                            postPic, postDate,catId, userId);
                    posts.add(post);
                }
            }
        } catch (SQLException e) {
            //noinspection CallToPrintStackTrace
            e.printStackTrace();
        }
        return posts;
    }

    public Post getPostByPostId(int post_Id) {
        Post post = null;
        try {
            @SuppressWarnings("SqlNoDataSourceInspection")
            String q = "SELECT * FROM post where postId = ?";
            try (PreparedStatement statement = ConnectionProvider.getConnection().prepareStatement(q)) {
                statement.setInt(1, post_Id);
                ResultSet set = statement.executeQuery();
                while (set.next()) {
                    int postId = set.getInt("postId");
                    String postTitle = set.getString("postTitle");
                    String postContent = set.getString("postContent");
                    String postCode = set.getString("postCode");
                    String postPic = set.getString("postPic");
                    Timestamp postDate = set.getTimestamp("postDate");
                    int catId = set.getInt("categoryId");
                    int userId = set.getInt("userId");

                    post = new Post(postId, postTitle, postContent, postCode,
                            postPic, postDate,catId, userId);
                }
            }
        } catch (SQLException e) {
            //noinspection CallToPrintStackTrace
            e.printStackTrace();
        }
        return post;
    }

}
