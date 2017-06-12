
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.mysql.cj.jdbc.Driver;

/**
 * Created by roxana on 6/9/17.
 */
public class MySQLUsersDao implements Users{
    private Connection connection;

    public MySQLUsersDao(Config config) throws SQLException {
        DriverManager.registerDriver(new Driver());
        this.connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUsername(),
                config.getPassword()
        );
    }

    @Override
    public List<User> all() throws SQLException {
        try {
            return selectUsers(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private List<User> selectUsers(Connection connection) throws SQLException {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM users";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String username = resultSet.getString("username");
            String password = resultSet.getString("password");
            String email = resultSet.getString("email");
            User user = new User(id, username, password, email);
            users.add(user);
        }
        return users;
    }

    @Override
    public long insert(User user) throws SQLException {
        try {
            return insertUser(user, connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    private long insertUser(User user, Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        String query = "INSERT INTO users(username, password, email)" +
                "VALUES ('" + user.getUsername() + "', '" + user.getPassword() + "', '" + user.getEmail() + "')";
        statement.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
        ResultSet resultSet = statement.getGeneratedKeys();
        return resultSet.getLong(1);
    }
}
