package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

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
		return "/query.jsp";
	}
	
	@RequestMapping(value="/queryAllUser",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String queryAllUser(HttpServletRequest request,HttpServletResponse response) {
		
		List<User> users = this.service.queryAllUser();
		for(User user:users) {
			System.out.println(user);
		}
		String jsonString = JSONObject.toJSONString(users);
		return jsonString;
	}
	
	@RequestMapping("/query2")
	public String query2(User user, Model model) {
		List<User> users = this.service.query2(user);
		model.addAttribute("users", users);
		return "/admin/queryUser.jsp";
	}
	
	
	@RequestMapping("/insert")
	public String insert(User user) {
		int tag = this.service.insert(user);
		System.out.println("tag:"+tag);
		return "/admin/addUser.jsp";
	}
	
	
}
