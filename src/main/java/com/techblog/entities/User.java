package com.techblog.entities;

import java.sql.Timestamp;

@SuppressWarnings("unused")
public class User {
    private int id;
    private String username;
    private String email;
    private String password;
    private String gender;
    private String about;
    private Timestamp timestamp;
    private String profile;

    public User () {
    }

    public User (String username, String email, String password, String gender, String about) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
    }

    public int getId () {
        return id;
    }

    public void setId (int id) {
        this.id = id;
    }

    public String getUsername () {
        return username;
    }

    public void setUsername (String username) {
        this.username = username;
    }

    public String getEmail () {
        return email;
    }

    public void setEmail (String email) {
        this.email = email;
    }

    public String getPassword () {
        return password;
    }

    public void setPassword (String password) {
        this.password = password;
    }

    public String getAbout () {
        return about;
    }

    public void setAbout (String about) {
        this.about = about;
    }

    public String getGender () {
        return gender;
    }

    public void setGender (String gender) {
        this.gender = gender;
    }

    public Timestamp getTimestamp () {
        return timestamp;
    }

    public void setTimestamp (Timestamp timestamp) {
        this.timestamp = timestamp;
    }


    public String getProfile () {
        return profile;
    }


    public void setProfile (String profile) {
        this.profile = profile;
    }
}