package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();

    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    //get ad given the id
    Ad findById(long id);

    //find Ads that their titles contain the String search
    List<Ad> findByTitle(String search);

    //find Ads by user id
    List<Ad> findByUserId(long user_id);

    void deleteAd(long id);

    void update(long id, String title, String desc, Float price, String url, String category);
}
