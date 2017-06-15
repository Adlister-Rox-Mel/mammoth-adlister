package com.codeup.adlister.models;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private float price;
    private String description;
    private String url;
    private String category;

    public Ad(long id, long userId, String title, String description, float price, String url, String category) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.url = url;
        this.category = category;
    }

    public Ad(long userId, String title, String description, float price, String url, String category) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.url = url;
        this.category = category;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public String getUrl() {
        return url;
    }

    public String getCategory() {
        return category;
    }
}
