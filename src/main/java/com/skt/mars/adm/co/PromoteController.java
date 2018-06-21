package com.skt.mars.adm.co;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;
import twitter4j.conf.ConfigurationBuilder;

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.co.ut.TwitterClient;

/**
 * CommerceController - 커머스 홍보 관리
 * 
 * @author Kim Do Youn
 * @version
 * @since
 * @created 2012. 02. 08.
 */

@Controller
public class PromoteController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());
//	final String TW_CONSUMER_KEY = "8Zdej5LyC2TZMXegak6REg"; //박상만 과장 Twitter Key
//	final String TW_CONSUMER_SECRET = "qDq94rPCgEjvCAhWCZPh4F81THlsSnp5Q3wP2M5uer0"; //박상만 과장 Twitter Key
	final String TW_CONSUMER_KEY = "kbC6tnUm0L0k4skFDeBOcQ"; //공용 Twitter Key
	final String TW_CONSUMER_SECRET = "juy7fG4ALumt1iPxvfmnTWJ3XshPIiNqyNiHy7Vag"; //공용 Twitter Key
	final String Access_token = "1287700591-R33pXV9ZpUkX5wu6BtCKf3jsJ8XqYKuaUcOuzxy"; //공용 Twitter Key
	final String Access_token_secret = "XvrqZFnalzwLirIPk43NNvy1cwr0vBfTmDKIS7aM6L8"; //공용 Twitter Key
	String CLIENT_ID = "760186707922-6htj91b8nidr1hiobgm8laplj9v92n2t.apps.googleusercontent.com";
	 String CLIENT_SECRET = "r1o1tcxf9r0R7W0f3lzPKuFU";
	 List<String> SCOPE = Arrays.asList(
  		"https://www.googleapis.com/auth/userinfo.email", 
			"https://www.googleapis.com/auth/userinfo.profile",
			"https://www.googleapis.com/auth/blogger", 
			"https://picasaweb.google.com/data/"
  		 ); 
	// command words
	private static String TARGET = "promote.";	// modify here
	private static String INSERT = "insert";
	private static String READ = "read";
	private static String LIST = "list";
	//private static String DELPOP = "fbDel";
	private static String DELPOP = "twDel_pop";
	private static String BSDELPOP = "bsDel_pop";
	
	@Autowired
	private PromoteService promoteService;	// modify here
	/*
	public PromoteController(){
		//default constructor
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String form(Model model) {
		return INSERT;
	}*/

	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new Promote();
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String submit(@ModelAttribute("command") @Valid Promote promote, 
			BindingResult result, Model model, HttpServletRequest req) throws Exception{
		
		model.addAttribute("method", INSERT);
		model.addAttribute("command", promote);
		
		
		return TARGET+READ;
	}
	
	
	//홍보글 관리 리스트 검색
    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value="/adm/promote/list")
	public ModelAndView list(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		
		//requestMap = getParameterMap(request);
		
		List<Promote> list = promoteService.selectList("PGADM0E10_L_01", requestMap);	// modify here
		
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(TARGET+LIST);
		
		return modelAndView;
	}

	 //홍보글 관리 관리 상세페이지
    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value="/adm/promote/read")
	public ModelAndView view(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);
		
		Promote promote  = promoteService.select("PGADM0E12_V_01", requestMap);	// modify here
		
		List<Promote> snsList  = promoteService.selectList("PGADM0E12_V_02", requestMap);	// modify here
		
		if(requestMap.get("") == null){
		
			if(requestMap.get("currentPage") == null){
				modelAndView.addObject("currentPage", 1);
			} else {
				modelAndView.addObject("currentPage", requestMap.get("currentPage"));
			}
			
			modelAndView.addObject("command2", snsList);
			modelAndView.addObject("command", promote);
			modelAndView.addObject("param", requestMap);
			modelAndView.setViewName(TARGET+READ);
		} else{
			if(requestMap.get("currentPage") == null){
				modelAndView.addObject("currentPage", 1);
			} else {
				modelAndView.addObject("currentPage", requestMap.get("currentPage"));
			}
			
			modelAndView.addObject("command2", snsList);
			modelAndView.addObject("command", promote);
			modelAndView.addObject("param", requestMap);
			modelAndView.setViewName(TARGET+READ);
		}
			
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="/promote/twDel_pop", method = RequestMethod.GET)
	public void twDel1(HttpServletRequest request, HttpServletResponse response, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);		
		//String url = "http://test.skcbckualatomani.com:8080/app_admin/adm/promote/twDel";
		String url = null;
		try {
			   
				TwitterClient tw = new TwitterClient(request); 
				RequestToken token = tw.getRequestToken();
//				request.setAttribute("requestToken", token);
				AccessToken actk = (AccessToken)request.getSession().getAttribute("accessToken");	
				url = token.getAuthenticationURL();			
				request.getSession().setAttribute("twPrmtSnsId",requestMap.get("twPrmtSnsId"));
				request.getSession().setAttribute("snsHsId",requestMap.get("snsHsId"));
				response.sendRedirect(url);			
		} catch (Exception e){
            e.printStackTrace();
		}
	}
	
	
	 //홍보글 관리 관리 상세페이지
	@RequestMapping(value="/adm/promote/twDel", method = RequestMethod.GET)
	public ModelAndView twDel(HttpServletRequest request, HttpServletResponse response, Map<String, String> requestMap, ModelAndView modelAndView) {
		
		requestMap = getParameterMap(request);
		
		try {
	            TwitterClient tw = new TwitterClient(request);
	            tw.getAccessToken(); //accessToken 반환가능 , 다른 용도?
	            
	            
		} catch (Exception e){
	            e.printStackTrace();
		}
		
		modelAndView.addObject("param", requestMap);
		modelAndView.setViewName(TARGET+DELPOP);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/promote/twDelOk", method = RequestMethod.GET)
	public ModelAndView twDelOk(HttpServletRequest request, HttpServletResponse response, Map<String, String> requestMap, ModelAndView modelAndView) throws Exception {
		requestMap = getParameterMap(request);
		TwitterClient tw = new TwitterClient(request); 
//		AccessToken actk = (AccessToken)request.getSession().getAttribute("accessToken");
//		AceessToken token = tw.getAccessToken();
//		AccessToken actk = tw.getAccessToken();
		HttpSession session = request.getSession();
		try{		
//			AccessToken token = tw.getAccessToken();
			
			ConfigurationBuilder cb = new ConfigurationBuilder();
			
            cb.setDebugEnabled(true)
            .setOAuthConsumerKey(TW_CONSUMER_KEY)
            .setOAuthConsumerSecret(TW_CONSUMER_SECRET) 
            .setOAuthAccessToken(Access_token)
            .setOAuthAccessTokenSecret(Access_token_secret);
             TwitterFactory tf = new TwitterFactory(cb.build()); 
             Twitter twitter = tf.getInstance();             
             String strId = (String) session.getAttribute("twPrmtSnsId");
             String snsHsId = (String) session.getAttribute("snsHsId");
             Status ss = twitter.destroyStatus(Long.parseLong(strId));
			//로그인 세션 적용되면 관리자 아이디 입력 
//			requestMap.put("adminId", "adminId");
             Map reMap = new HashMap();
             reMap.put("snsHsId", snsHsId);
			int checkEdit = promoteService.update("PGADM0E12_U_TW" ,reMap); 
//			System.out.println("ss##################### : " + ss);			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		Promote promote  = promoteService.select("PGADM0E12_V_01", requestMap);	// modify here
		
		List<Promote> snsList  = promoteService.selectList("PGADM0E12_V_02", requestMap);	// modify here
		
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject("command2", snsList);
		modelAndView.addObject("command", promote);
		modelAndView.addObject("param", requestMap);
		modelAndView.setViewName(TARGET+READ);	
		
		return modelAndView;
	}
	
	@RequestMapping(value="/adm/promote/bsDel_pop", method = RequestMethod.GET)
	public void bsDel1(HttpServletRequest request, HttpServletResponse response, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);
		String url = null;
		try{
//			BloggerClient bc = new BloggerClient();
//			RequestToken token = tw.getRequestToken();
//			AccessToken actk = (AccessToken)request.getSession().getAttribute("accessToken");	
//			url = bc.getAuthorizationUrl();						
//			HashMap<String, String> params = bc.parseFromUrl(url);
			
			response.sendRedirect(url);			
//			bc.delete(postId);
			
//			String url = null;			
//			BloggerClient bc = new BloggerClient(request); 
//			RequestToken token = bc.getRequestToken();
//			AccessToken actk = (AccessToken)request.getSession().getAttribute("accessToken");	
//			//tw.getAccessToken();
//			url = token.getAuthenticationURL();
//			url = token.getAuthorizationURL();
			//url = "javascript:window.PINNUMBER.showHTML(document.getElementById('oauth_pin').innerHTML);";
			
//			System.out.println("token 22222222222222222: " + token);
//			System.out.println("url 22222222222222222: " + url);				
//			response.sendRedirect(url);	
			
			//String url = bc.getAuthorizationUrl();
			
			//response.sendRedirect(url);
			
			//System.out.println("urlurlurlurlurl : " + url1);
			
			/*InputStream is = request.getSession().getAttribute("client_secrets.json");
			GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(
					JSON_FACTORY, 
					is);
			*/
			
			/*BloggerClient bc = new BloggerClient();
			String url1 = bc.buildLoginUrl();
			
			String ttt = bc.getUserInfoJson(url1);
			
			System.out.println("urlurlurlurlurl : " + url1);
			System.out.println("ttttttttttttttt : " + ttt);*/
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	
	
	 //홍보글 관리 블로그 스팟 토큰 셋팅
		@RequestMapping(value="/adm/promote/bsDel", method = RequestMethod.GET)
		public ModelAndView bsDel(HttpServletRequest request, HttpServletResponse response, Map<String, String> requestMap, ModelAndView modelAndView) {
			
			request.getSession().setAttribute("bs_access_token", request.getParameter("code"));
			
			System.out.println("codecodecodecode : " + request.getParameter("code"));
			System.out.println("statestatestatestatestate2222222222 : " + request.getParameter("state"));
			
						
//			BloggerClient bc = new BloggerClient();
			
//			if (request.getParameter("code") == null) {
//				/*
//				 * initial visit to the page
//				 */
//				try{
//					String url = bc.getAuthorizationUrl();
//					
//					response.sendRedirect(url);
//				}catch(Exception e){
//					e.printStackTrace();
//				}
//			} else if (request.getParameter("code") != null) {
//				//Blogger blogger = new Blogger.Builder(HTTP_TRANSPORT, JSON_FACTORY, mCredential).build();
//				/*
//				 * Executes after google redirects to the callback url.
//				 * Please note that the state request parameter is for convenience to differentiate
//				 * between authentication methods (ex. facebook oauth, google oauth, twitter, in-house).
//				 * 
//				 * GoogleAuthHelper()#getUserInfoJson(String) method returns a String containing
//				 * the json representation of the authenticated user's information. 
//				 * At this point you should parse and persist the info.
//				 */
//				try{
//					bc.delete("12dskcxnloqiwelkjcvlkzj"); 
//					//System.out.println("json code code code : " + bc.getUserInfoJson(request.getParameter("code")));
//				}catch(Exception e){
//					e.printStackTrace();
//				}
//			}
			
//			modelAndView.addObject("code", request.getParameter("code"));
//			modelAndView.addObject("param", requestMap);
//			modelAndView.setViewName(TARGET+BSDELPOP);
			
			return modelAndView;
		}
	
}
