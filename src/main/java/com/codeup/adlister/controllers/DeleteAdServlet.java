package com.codeup.adlister.controllers;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by melodytempleton on 6/14/17.
 */

@WebServlet (name="controllers.DeleteAdServlet", urlPatterns ="/delete")
public class DeleteAdServlet extends HttpServlet {

   protected void doPost(HttpServletRequest request, HttpServletResponse response) {

       long ad_id = Long.parseLong(request.getParameter("ad_id"));

   }
}
