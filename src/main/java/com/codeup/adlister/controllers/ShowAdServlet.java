package com.codeup.adlister.controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.*;

/**
 * Created by roxana on 6/12/17.
 */
@WebServlet(name = "ShowAdServlet", urlPatterns = "/ads/show")
public class ShowAdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long ad_id = Long.parseLong(request.getParameter("ad_id"));
        Ad ad = DaoFactory.getAdsDao().getAd(ad_id);
        User user = DaoFactory.getUsersDao().findById(ad.getUserId());
        request.getSession().setAttribute("ad", ad);
        request.getSession().setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/ads/show.jsp").forward(request, response);
    }
}
