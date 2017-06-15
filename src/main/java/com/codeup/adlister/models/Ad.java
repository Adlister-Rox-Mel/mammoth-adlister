package com.codeup.adlister.models;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private float price;
    private String description;
    private String url;

    public Ad(long id, long userId, String title, String description, float price, String url) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.url = url;
    }

    public Ad(long userId, String title, String description, float price, String url) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.url = url;
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
}
