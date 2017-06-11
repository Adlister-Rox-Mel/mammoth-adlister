import java.sql.SQLException;
import java.util.List;

/**
 * Created by roxana on 6/9/17.
 */
public interface Users {
    // get a list of all the users
    public List<User> all() throws SQLException;

    // insert a new user and return the user's id
    public long insert(User user);
}
