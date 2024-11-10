package com.techblog.entities;

import java.sql.Timestamp;

public class Post {

  private int postId;
  private String postTitle;
  private String postContent;
  private String postCode;
  private String postPic;
  private Timestamp postDate;
  private int categoryId;
  private int userId;

  public Post() {}

  public Post(int postId, String postTitle, String postContent, String postCode, String postPic, Timestamp postDate,
              int categoryId, int userId) {
    this.postId = postId;
    this.postTitle = postTitle;
    this.postContent = postContent;
    this.postCode = postCode;
    this.postPic = postPic;
    this.postDate = postDate;
    this.categoryId = categoryId;
    this.userId = userId;
  }

  public Post(
      String postTitle,
      String postContent,
      String postCode,
      String postPic,
      Timestamp postDate,
      int categoryId,
      int userId) {
    this.postTitle = postTitle;
    this.postContent = postContent;
    this.postCode = postCode;
    this.postPic = postPic;
    this.postDate = postDate;
    this.categoryId = categoryId;
    this.userId = userId;
  }

  public int getPostId() {
    return postId;
  }

  public void setPostId(int pid) {
    this.postId = pid;
  }

  public String getPostTitle() {
    return postTitle;
  }

  public void setPostTitle(String pTitle) {
    this.postTitle = pTitle;
  }

  public String getPostContent() {
    return postContent;
  }

  public void setPostContent(String pContent) {
    this.postContent = pContent;
  }

  public String getPostCode() {
    return postCode;
  }

  public void setPostCode(String pCode) {
    this.postCode = pCode;
  }

  public String getPostPic() {
    return postPic;
  }

  public void setPostPic(String pPic) {
    this.postPic = pPic;
  }

  public Timestamp getPostDate() {
    return postDate;
  }

  public void setPostDate(Timestamp pDate) {
    this.postDate = pDate;
  }

  public int getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(int catId) {
    this.categoryId = catId;
  }

  public int getUserId() {
    return userId;
  }

  public void setUserId(int userId) {
    this.userId = userId;
  }
}
