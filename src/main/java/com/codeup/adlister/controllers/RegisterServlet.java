package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.codeup.adlister.util.*;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("passwordMatch") == null ) {
            request.getSession().setAttribute("passwordMatch", true);
        }
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        User user = DaoFactory.getUsersDao().findByUsername(username);

        // validate input
        boolean passwordMatch = password.equals(passwordConfirmation);
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty()
            || !passwordMatch;


        boolean usernameUnique = user == null;

        if (inputHasErrors || !usernameUnique) {
            request.getSession().setAttribute("passwordMatch", passwordMatch);
            response.sendRedirect("/register");
            return;
        }

        // create and save a new user
        password = Password.hash(password);
        user = new User(username, email, password);
        DaoFactory.getUsersDao().insert(user);
        request.getSession().setAttribute("user", user);
        response.sendRedirect("/login");
    }
}
