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

/**
 * Created by roxana on 6/16/17.
 */
@WebServlet(name = "UpdateProfileServlet", urlPatterns = "/profile/update")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("user_id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String url = request.getParameter("url");
        String passwordConfirmation = request.getParameter("confirm_password");

        User user = DaoFactory.getUsersDao().findById(id);

        // validate input
        boolean passwordMatch = password.equals(passwordConfirmation);
        boolean inputIsEmpty = username.isEmpty()
                || email.isEmpty()
                || password.isEmpty();
        boolean inputHasErrors = inputIsEmpty || !passwordMatch;


        if (inputHasErrors) {
            User invalidUser = new User(username, email, password, phone, url);
            request.getSession().setAttribute("user", invalidUser);
            request.getSession().setAttribute("inputIsEmpty", inputIsEmpty);
            request.getSession().setAttribute("passwordMatch", passwordMatch);
            response.sendRedirect("/profile/update");
            return;
        }

        // create and save a new user
        password = Password.hash(password);
        user = new User(id, username, email, password, phone, url);
        DaoFactory.getUsersDao().update(user);
        request.getSession().setAttribute("user", user);
        response.sendRedirect("/profile");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("passwordMatch") == null ) {
            request.getSession().setAttribute("passwordMatch", true);
        }
        request.getRequestDispatcher("/WEB-INF/update.jsp").forward(request, response);
    }
}
