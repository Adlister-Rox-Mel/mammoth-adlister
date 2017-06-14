package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by melodytempleton on 6/14/17.
 */

@WebServlet (name="controllers.DeleteAdServlet", urlPatterns ="/delete")
public class DeleteAdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        long ad_id = Long.parseLong(request.getParameter("ad_id"));
        DaoFactory.getAdsDao().deleteAd(ad_id);
        User user = (User) request.getSession().getAttribute("user");
        List<Ad> ads = DaoFactory.getAdsDao().findByUserId(user.getId());
        request.getSession().setAttribute("myAds", ads);
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }

}
