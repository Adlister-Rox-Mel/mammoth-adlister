package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by roxana on 6/12/17.
 */
@WebServlet(name = "ViewUsersServlet", urlPatterns = "/users")
public class ViewUsersServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("user", DaoFactory.getUsersDao().findByUsername("rox"));
        request.getRequestDispatcher("/WEB-INF/view-users.jsp").forward(request, response);
    }
}
