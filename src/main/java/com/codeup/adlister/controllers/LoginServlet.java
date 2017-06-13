package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("invalidPassword") == null ) {
            request.getSession().setAttribute("invalidPassword", false);
        }

        if(request.getSession().getAttribute("invalidUsername") == null) {
            request.getSession().setAttribute("invalidUsername", false);
        }
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);
        boolean invalidUsername = user == null;

        if(invalidUsername) {
            request.getSession().setAttribute("invalidUsername", invalidUsername);
            response.sendRedirect("/login");
            return;
        }
        //Verify a given password matches a hash
        boolean validAttempt = Password.check(password, user.getPassword());


        if(!validAttempt) {
            request.getSession().setAttribute("invalidPassword", validAttempt);
            response.sendRedirect("/login");
        } else {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/profile");
        }
    }
}
