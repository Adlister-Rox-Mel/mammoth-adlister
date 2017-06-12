package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;


/**
 * Created by roxana on 6/12/17.
 */
public class MySQLUsersDao implements Users {
    private Connection connection =null;

    public MySQLUsersDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUsername(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public User findByUsername(String username) {
        User user = null;
        Statement statement = null;
        String select = String.format("Select * from users where username ='%s'", username);
        try {
            statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(select);
            rs.next();
            user = new User(
                    rs.getLong("id"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("password")
            );
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public Long insert(User user) {

        return null;
    }
}
