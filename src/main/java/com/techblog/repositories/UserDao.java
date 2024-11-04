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
                user.setUsername(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setProfile(set.getString("profile"));
                user.setId(set.getInt("id"));
                user.setTimestamp(set.getTimestamp("registration_date"));
                user.setAbout(set.getString("about"));
                user.setGender(set.getString("gender"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    public boolean updateUser(User user){
        boolean flag =false;
        try{
            @SuppressWarnings("SqlNoDataSourceInspection") String query= "update user set name=? , email = ? , gender= ?, about= ? , profile=? where id = ?";
            PreparedStatement preparedStatement = this.connection.prepareStatement(query);
            //set values
            preparedStatement.setString(1,user.getUsername());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getGender());
            preparedStatement.setString(4,user.getAbout());
            preparedStatement.setString(5,user.getProfile());
            preparedStatement.setInt(6,user.getId());

            preparedStatement.executeUpdate();
            flag = true;

        }catch (SQLException e){
            //noinspection CallToPrintStackTrace
            e.printStackTrace();
        }
        return flag;
    }
}