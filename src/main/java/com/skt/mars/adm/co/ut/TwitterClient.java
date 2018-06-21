package com.skt.mars.adm.co.ut;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;
import twitter4j.conf.ConfigurationBuilder;

public class TwitterClient {
	
	private HttpServletRequest request;

	 

    private Twitter twitter;

    RequestToken requestToken = null;

    AccessToken accessToken = null;

    String q = "";
    
//    final String TW_CONSUMER_KEY = "8Zdej5LyC2TZMXegak6REg";
    
//	final String TW_CONSUMER_SECRET = "qDq94rPCgEjvCAhWCZPh4F81THlsSnp5Q3wP2M5uer0";
	
	final String TW_CONSUMER_KEY = "kbC6tnUm0L0k4skFDeBOcQ"; //공용 Twitter Key
	
	final String TW_CONSUMER_SECRET = "juy7fG4ALumt1iPxvfmnTWJ3XshPIiNqyNiHy7Vag"; //공용 Twitter Key

    /**
     * 생성자
     * @param req
     */
    public TwitterClient(HttpServletRequest req) {
    	request = req;
    }


    /**
     * RequestToken를받기
     * @return
     */
    public RequestToken getRequestToken(){
	     twitter = new TwitterFactory().getInstance();
	     twitter.setOAuthConsumer(TW_CONSUMER_KEY, TW_CONSUMER_SECRET);
	
	      requestToken = null;
	      try {
	                   requestToken = twitter.getOAuthRequestToken();
	                   request.getSession().setAttribute("requestToken", requestToken);
	      }
	      catch(TwitterException te)  {
	                   te.printStackTrace();
	      }
	      
	      return requestToken;
    }

    /**
     * AccessToken 토큰받기
     * @return
     * @throws Exception
     */
    public AccessToken getAccessToken() throws Exception{
	      String oauthToken = request.getParameter("oauth_token");
	      String oauth_verifier = request.getParameter("oauth_verifier");

	      requestToken = request.getSession()!=null ? (RequestToken)request.getSession().getAttribute("requestToken") : null;
	      
	      
	      if(requestToken == null) {
	                   throw new Exception("error requestToken == null");
	      }
	      if(oauthToken == null) {
	                   throw new Exception("error oauthToken == null");
	      }
	      
	      twitter = new TwitterFactory().getInstance();
	      twitter.setOAuthConsumer(TW_CONSUMER_KEY, TW_CONSUMER_SECRET);
	      
	      if(requestToken.getToken().equals(oauthToken)) {
	                   try {
                            accessToken = twitter.getOAuthAccessToken(requestToken,oauth_verifier);
                            twitter.setOAuthAccessToken(accessToken);
                            
                            request.getSession().setAttribute("accessToken", accessToken);
	                   }
	                   catch(TwitterException te) {
	                                te.printStackTrace();
	                   }
	      }
	      else {
	                   throw new Exception("oauth_token error");                 
	      }
	      return accessToken;
    }

    /**
     * AccessToken으로사용자 인증 받기
     * @return
     */
    public Twitter getTwitter() {
                  twitter = new TwitterFactory().getInstance();
                  twitter.setOAuthConsumer(TW_CONSUMER_KEY, TW_CONSUMER_SECRET);

                  if (request.getSession()!=null){
                               AccessToken accessToken = (AccessToken)request.getSession().getAttribute("accessToken");
                               twitter.setOAuthAccessToken(accessToken);
                  }

                  return twitter;
    }

    public void setTwitter(Twitter twitter) {
                  this.twitter = twitter;
    }

	
	 public boolean isAuthorized(HttpServletRequest request) {
    	String accesstoken = (String)request.getSession().getAttribute("twitter_accesstoken");
		String accesstoken_secret =  (String)request.getSession().getAttribute("twitter_accesstoken_secret");
		if(accesstoken == null || accesstoken_secret == null)
			return false;
		
		return true;
    }
	 
	 private void reauthorize(HttpServletRequest request) {
			ConfigurationBuilder cb = new ConfigurationBuilder();
					cb.setOAuthConsumerKey(TW_CONSUMER_KEY);
					cb.setOAuthConsumerSecret(TW_CONSUMER_SECRET);

			
			String accesstoken = (String)request.getSession().getAttribute("TW_ACCESS_TOKEN");
			String accesstoken_secret = (String)request.getSession().getAttribute("TW_ACCESS_TOKEN_SECRET");
			AccessToken accessToken = new AccessToken(accesstoken, accesstoken_secret);
			request.getSession().setAttribute("TW_ACCESS_TOKEN", accessToken);
	    }
}
