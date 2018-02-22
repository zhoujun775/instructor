package controller;

import java.util.List;
import service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import entity.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService service;
	
	@RequestMapping("/query")
	public String query(User user, Model model) {
		List<User> users = this.service.query(user);
		model.addAttribute("users", users);
		System.out.println("userController worked!");
		return "/query.jsp";
	}
}
