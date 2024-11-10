package com.techblog.entities;

public class Category {
  private int categoryId;
  private String categoryName;
  private String description;

  public Category(int cid, String name, String description) {
    this.categoryId = cid;
    this.categoryName = name;
    this.description = description;
  }

  public Category() {}

  public Category(String name, String description) {
    this.categoryName = name;
    this.description = description;
  }

  public int getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(int cid) {
    this.categoryId = cid;
  }

  public String getCategoryName() {
    return categoryName;
  }

  public void setCategoryName(String name) {
    this.categoryName = name;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }
}
