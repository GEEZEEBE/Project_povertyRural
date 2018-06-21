package com.skt.mars.adm.sample;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.skt.mars.adm.cm.DefaultController;

@Controller
@RequestMapping("/board")	// modify here
public class BoardController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());

	// command words
	private static String TARGET = "board.";	// modify here
	private static String INSERT = "insert";
	private static String READ = "read";
	private static String LIST = "list";
	
	@Autowired
	private BoardService boardService;	// modify here
	
	@RequestMapping(method = RequestMethod.GET)
	public String form(Model model) {
		return TARGET+INSERT;
	}

	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new Board();
	}

	@RequestMapping(method = RequestMethod.POST)
	public String submit(@ModelAttribute("command") @Valid Board board,
			BindingResult result, Model model) {
		// Check Validation
		if (result.hasErrors()) {
			return TARGET+INSERT;
		}
		String id = (String)boardService.insert(TARGET+INSERT, board);
		
		model.addAttribute("method", INSERT);
		model.addAttribute("cnt", id);
		return TARGET+READ;
	}

	@RequestMapping(value="/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {

		List list = boardService.selectList(TARGET+LIST, requestMap);	// modify here

		requestMap = getParameterMap(request);
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}

		modelAndView.addObject(LIST, list);
			
		modelAndView.setViewName(TARGET+LIST);		
		
		return modelAndView;
	}
	
	/**
	 * Simply selects the test view to render by returning its name.
	 */
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		
		return "board.insert";
	}
	
}
