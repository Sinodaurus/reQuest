package controllers;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	Random random = new Random();
	
	@RequestMapping(value = "/")
	public String goHome() {
		System.out.println("going through index...");
		return "WEB-INF/JSP/index.jsp";
	}
	
	@RequestMapping(value = "/snake")
	public String goSnake() {
		System.out.println("going through snake...");
		return "WEB-INF/JSP/snake.jsp";
	}
	
	@RequestMapping(value = "/game")
	public String goGame() {
		System.out.println("going through game...");
		return "WEB-INF/JSP/game.jsp";
	}
	
	@RequestMapping(value = "/colorAjax", method = RequestMethod.GET)
	public @ResponseBody Map<String, Integer> color() {
		int x = getRandomBetweenZeroAnd(476);
		int y = getRandomBetweenZeroAnd(476);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("x", x);
		map.put("y", y);
		return map;
	}
	
	@RequestMapping(value = "/snakeAjax", method = RequestMethod.GET)
	public @ResponseBody Map<String, Integer> snake() {
		int x = getRandomBetweenNegativeAnd(3);
		int y = getRandomBetweenNegativeAnd(3);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("x", x);
		map.put("y", y);
		return map;
	}
	
	private int getRandomBetweenZeroAnd(int max) {
		return Math.abs(random.nextInt(max));
	}
	
	private int getRandomBetweenNegativeAnd(int max) {
		return (random.nextInt(max) - 1);

	}
}
