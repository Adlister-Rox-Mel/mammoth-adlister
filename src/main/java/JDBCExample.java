import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

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
        insertExample(connection);
    }

    public static void insertExample(Connection connection) throws SQLException {
        Statement stmt = connection.createStatement();
//        String query = "INSERT into users(username, password, email)\n" +
//                "VALUES ('user1', '123', 'user1@gmail.com')";

        String query = "INSERT INTO ads(title, description, user_id)\n" +
                "    VALUES ('playstation for sale','This is a slightly used playstation', '1')";
        stmt.execute(query);
    }
}
