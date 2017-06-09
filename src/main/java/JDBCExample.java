import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by roxana on 6/9/17.
 */
public class JDBCExample {

    public static void main(String[] args) throws SQLException {
        Config config = new Config();
        Connection connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUsername(),
                config.getPassword()
        );
//        insertAds(connection);
        selectAds(connection);
    }

    public static void insertAds(Connection connection) throws SQLException {
        Statement stmt = connection.createStatement();
//        String query = "INSERT into users(username, password, email)\n" +
//                "VALUES ('user1', '123', 'user1@gmail.com')";

        String query = "INSERT INTO ads(title, description, user_id)\n" +
                "    VALUES ('playstation for sale','This is a slightly used playstation', '1')";
        stmt.execute(query);
    }

    public static List<Ad> selectAds(Connection connection) throws SQLException {
        String query = "SELECT * FROM ads";
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        List<Ad> ads = new ArrayList<>();

        // move the cursor through the results
        // this while loop will run once for each row in the results
        while (rs.next()) {
            int user_id = rs.getInt("user_id");
            String title = rs.getString("title");
            String description = rs.getString("description");
            Ad ad = new Ad(user_id, title, description);
            ads.add(ad);

            System.out.println("----------------------------------------");
            System.out.println("title: " + title);
            System.out.println("description: " + description);
        }
        return ads;
    }
}