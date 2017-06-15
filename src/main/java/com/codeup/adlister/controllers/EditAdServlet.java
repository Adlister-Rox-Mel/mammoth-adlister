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

@WebServlet(name="EditAdServlet", urlPatterns = "/ads/edit")
public class EditAdServlet extends HttpServlet {

    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long ad_id = Long.parseLong(request.getParameter("ad_id"));
        Ad ad = DaoFactory.getAdsDao().findById(ad_id);
        request.getSession().setAttribute("ad", ad);
        request.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        long id = (long) request.getSession().getAttribute("user_id");
        long ad_id = Long.parseLong(request.getParameter("ad_id"));
//        long user_id_from_ad = DaoFactory.getAdsDao().findById(ad_id).getUserId();
//        if(id == user_id_from_ad ) {

            String ad_title = request.getParameter("ad_title");
            String ad_description = request.getParameter("ad_description");
            Float ad_price = Float.parseFloat(request.getParameter("ad_price"));
            String ad_url = request.getParameter("ad_url");
            String ad_category = request.getParameter("ad_category");
            DaoFactory.getAdsDao().update(ad_id, ad_title, ad_description, ad_price,ad_url, ad_category);
            Ad ad = DaoFactory.getAdsDao().findById(ad_id);
            request.getSession().setAttribute("ad", ad);
            request.getRequestDispatcher("/WEB-INF/ads/show.jsp").forward(request, response);

//        }

//        else {
//            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
//        }
    }
}
