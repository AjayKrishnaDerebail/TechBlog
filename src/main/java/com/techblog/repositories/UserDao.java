package com.techblog.repositories;

import com.techblog.entities.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    private final Connection connection ;

    public UserDao(Connection connection){
        this.connection=connection;
    }

    public boolean saveUser(User user){
        boolean flag=false;
        @SuppressWarnings("SqlNoDataSourceInspection")
        String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
        try{


            PreparedStatement statement = this.connection.prepareStatement(query);
            statement.setString(1,user.getUsername());
            statement.setString(2,user.getEmail());
            statement.setString(3,user.getPassword());
            statement.setString(4,user.getGender());
            statement.setString(5,user.getAbout());

            statement.executeUpdate();
            flag=true;
        } catch (SQLException se){
            //noinspection CallToPrintStackTrace
            se.printStackTrace();
        }
        return flag;
    }

    public User getUserByEmailAndPassword(String email, String password){
        User user = null;
        try{
            @SuppressWarnings("SqlNoDataSourceInspection")
            String query = "select * from user where email = ? and password = ?";
            PreparedStatement statement = this.connection.prepareStatement(query);
            statement.setString(1,email);
            statement.setString(2,password);

            ResultSet set = statement.executeQuery();
            while(set.next()){
                user = new User();
                String name = set.getString("name");
                String userEmail = set.getString("email");
                user.setUsername(name);
                user.setEmail(userEmail);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }
}