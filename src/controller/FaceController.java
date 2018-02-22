package controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FaceService;
import sun.misc.BASE64Decoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import entity.Face;

@Controller
@RequestMapping("/face")
public class FaceController {
	
	@Autowired
	private FaceService service;
	
	@RequestMapping("/query")
	public String query(Face face, Model model) {
		List<Face> faces = this.service.query(face);
		model.addAttribute("faces", faces);
		return "/query2.jsp";
	}
	
	@RequestMapping(value="/faceRec",method=RequestMethod.POST)
	@ResponseBody
	public String faceRec(String img) throws Exception{
		System.out.println(img);
		
		String path = FaceController.class.getClassLoader().getResource("../../resources/images/test.png").getPath();
		System.out.println(path);
		
		BASE64Decoder decoder = new BASE64Decoder();    
        byte[] b = decoder.decodeBuffer(img);    
        ByteArrayInputStream bais = new ByteArrayInputStream(b);    
        BufferedImage bi = ImageIO.read(bais);    
        File w2 = new File(path);    
        ImageIO.write(bi,"png",w2);
        
        System.out.println("faceRec worked!");
        String result = "success";
        String jsonString = JSONObject.toJSONString(result);
		return jsonString;
		
	}

}
