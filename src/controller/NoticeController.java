package controller;

import org.json.JSONObject;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import service.FaceService;
import service.NoticeService;
import sun.misc.BASE64Decoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.youtu.Youtu;

import dao.FaceDao;
import entity.Face;
import entity.Notice;
import entity.User;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/insert")
	public String insert(Notice notice) {
		
		String datetime=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss").format(Calendar.getInstance().getTime()); 
		notice.setTime(datetime);
		System.out.println(notice);
		int tag = this.service.insert(notice);
		System.out.println("tag:"+tag);
		return "/admin/insertNotice.jsp";
	}
	
	@RequestMapping("/query")
	public String query(Notice notice, Model model) {
		List<Notice> notices = this.service.query(notice);
		model.addAttribute("notices", notices);
		return "/admin/queryNotice.jsp";
	}
	
	@RequestMapping("/queryAll")
	public String queryAll(Model model) {
		List<Notice> notices = this.service.queryAll();
		if(notices!=null)
			System.out.println("查看通知成功！");
		for(Notice n:notices) {
			System.out.println(n);
		}
		
		model.addAttribute("allNotice", notices);
		return "/admin/notice.jsp";
	}
	
	@RequestMapping("/queryAll2")
	public String queryAll2(Model model) {
		List<Notice> notices = this.service.queryAll();
		if(notices!=null)
			System.out.println("查看通知成功！");
		for(Notice n:notices) {
			System.out.println(n);
		}
		
		model.addAttribute("allNotice", notices);
		return "/visitor/notice2.jsp";
	}
	
	
	@RequestMapping("/update")
	public String update(Notice notice) {
		String datetime=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss").format(Calendar.getInstance().getTime());
		notice.setTime(datetime);
		int tag = this.service.update(notice);
		if(tag!=0)
		System.out.println("修改通知成功！");
		return "/admin/queryNotice.jsp";
	}
	
	@RequestMapping("/delete")
	public String delete(Integer noticeID) {
		int tag = this.service.delete(noticeID);
		if(tag!=0)
			System.out.println("删除通知成功！");
		return "/admin/queryNotice.jsp";
	}

}
