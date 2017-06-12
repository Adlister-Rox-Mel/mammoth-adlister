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
        //Using prepared statements to avoid problems with user input going into the database (SQL injection)
        User user = null;
        PreparedStatement statement = null;
//        String select = String.format("Select * from users where username ='%s'", username);
        String select = "SELECT * FROM users WHERE username=?";
        try {
            statement = connection.prepareStatement(select);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
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
        String insert = "INSERT INTO users(id, username, password, email) VALUES (?, ?, ?, ?)";
        PreparedStatement statement =null;
        long id = -1;

        try {
            statement = connection.prepareStatement(insert);
            statement.setLong(1, user.getId());
            statement.setString(2, user.getUsername());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getEmail());
            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
            rs.next();
            id = rs.getLong(1);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
