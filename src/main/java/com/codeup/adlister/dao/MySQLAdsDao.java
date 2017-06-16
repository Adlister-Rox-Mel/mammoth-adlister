package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.codeup.adlister.*;

public class MySQLAdsDao extends MySQLDao implements Ads {

    public MySQLAdsDao(Config config) {
        super(config);
    }


    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, price, description, url, category) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setFloat(3, ad.getPrice());
            stmt.setString(4, ad.getDescription());
            stmt.setString(5, ad.getUrl());
            stmt.setString(6, ad.getCategory());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public Ad findById(long id) {
        try {
            Statement statement = connection.createStatement();
            String query = "SELECT * FROM ads WHERE id=" + id;
            ResultSet rs = statement.executeQuery(query);
            rs.next();
            return extractAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving an Ad.", e);
        }
    }

    @Override
    public List<Ad> findByTitle(String search) {
        String query = "SELECT * FROM ads WHERE title LIKE ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, "%" + search + "%");
            return createAdsFromResults(statement.executeQuery());

        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving list of Ads.", e);
        }
    }

    @Override
    public List<Ad> findByUserId(long user_id) {
        String query = "SELECT * FROM ads WHERE user_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setLong(1, user_id);
            return createAdsFromResults(statement.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving list of Ads.", e);
        }
    }

    @Override
    public void deleteAd(long id) {
        try {
            Statement statement = connection.createStatement();
            String query = "DELETE FROM ads WHERE id=" + id;
            statement.executeUpdate(query);
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting an Ad.", e);
        }
    }

    @Override
    public void update(Ad ad) {
        try {
            String updateQuery = "UPDATE ads SET title = ?, description = ?, price =?, url =?, category = ? WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(updateQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setFloat(3, ad.getPrice());
            stmt.setString(4, ad.getUrl());
            stmt.setString(5, ad.getCategory());
            stmt.setLong(6, ad.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description"),
            rs.getFloat("price"),
            rs.getString("url"),
            rs.getString("category")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}
