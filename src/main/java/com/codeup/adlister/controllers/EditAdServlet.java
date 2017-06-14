package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by melodytempleton on 6/14/17.
 */

@WebServlet(name="controllers/EditAdServlet", urlPatterns = "/ads/edit")
public class EditAdServlet extends HttpServlet {

    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long ad_id = Long.parseLong(request.getParameter("ad_id"));
        Ad ad = DaoFactory.getAdsDao().findById(ad_id);
        request.getSession().setAttribute("ad", ad);
        request.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(request, response);

    }


}
