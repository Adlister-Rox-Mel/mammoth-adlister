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
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
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

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
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
