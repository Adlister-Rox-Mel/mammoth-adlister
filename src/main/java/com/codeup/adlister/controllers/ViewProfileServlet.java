package com.codeup.adlister.controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.*;

@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        //Show list of user's ads
        User user = (User) request.getSession().getAttribute("user");
        List<Ad> ads = DaoFactory.getAdsDao().findAdsByUserId(user.getId());
        request.getSession().setAttribute("myAds", ads);
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }
}
