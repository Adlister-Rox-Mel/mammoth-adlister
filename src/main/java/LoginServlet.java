import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by roxana on 6/7/17.
 */
@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        if (request.getMethod().equalsIgnoreCase("post")) {
//            String username = request.getParameter("username");
//            String password = request.getParameter("password");
//            if (username.equals("admin") && password.equals("password")) {
//                response.sendRedirect("/profile.jsp");
//            }
//        }
        String username = request.getParameter("username");
        request.setAttribute("username", username);

        String password = request.getParameter("password");
        request.setAttribute("password", password);

        if (username.equals("admin") && password.equals("password")) {
            response.sendRedirect("/profile.jsp");
        }
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
