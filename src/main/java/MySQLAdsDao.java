import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.mysql.cj.jdbc.Driver;

/**
 * Created by roxana on 6/9/17.
 */
public class MySQLAdsDao implements Ads {

    private Connection connection = null;

    public MySQLAdsDao(Config config) throws SQLException {
        DriverManager.registerDriver(new Driver());
        connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUsername(),
                config.getPassword()
        );
    }

    @Override
    public List<Ad> all() throws SQLException {
        try {
            return selectAds(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Long insert(Ad ad) {
        return null;
    }

    private List<Ad> selectAds(Connection connection) throws SQLException {
        String query = "SELECT * FROM ads";
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        List<Ad> ads = new ArrayList<>();

        // move the cursor through the results, this while loop will run once for each row in the results
        while (rs.next()) {
            int user_id = rs.getInt("user_id");
            String title = rs.getString("title");
            String description = rs.getString("description");
            Ad ad = new Ad(user_id, title, description);
            ads.add(ad);
        }
        return ads;
    }
}
