package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();

    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    //get ad given the id
    Ad getAd(long id);

    //find Ads that their titles contain the String search
    List<Ad> findAdsByTitle(String search);

    //find Ads by user id
    List<Ad> findAdsByUserId(long user_id);
}
