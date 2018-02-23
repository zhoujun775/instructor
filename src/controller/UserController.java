package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("/login")
	public String userlogin(String userName,String password,
			Integer identity,HttpSession httpSession) {
		
		if(userName==null || userName=="" ||password==null || password=="" ||identity==null) {
			String msg="用户名，密码或身份为空！";
			httpSession.setAttribute("msg", msg);
			return "redirect:/login.jsp";
		}
		try {
		User user =this.service.queryByName(userName);
		if(user.getPassword().equals(password)&&identity==0 &&user.getIdentity().equals(identity)) {
			System.out.println("学生"+user.getUserName()+"登录");
			httpSession.setAttribute("user", user);
			return "redirect:/visitor/index.jsp";
		}
		else if(user.getPassword().equals(password)&&identity==1&&user.getIdentity().equals(identity)) {
			httpSession.setAttribute("user", user);
			System.out.println("管理员"+user.getUserName()+"登录了");
			return "redirect:/admin/index.jsp";
		}
		}catch (Exception e) {
			String msg="用户名，密码或身份错误！";
			httpSession.setAttribute("msg", msg);
			return "redirect:/login.jsp";
		}
		return "redirect:/login.jsp";
	}
	
	
	@RequestMapping("/query")
	public String query(User user, Model model) {
		List<User> users = this.service.query(user);
		model.addAttribute("users", users);
		System.out.println("userController worked!");
		return "/query.jsp";
	}
}
