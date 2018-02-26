package controller;

import org.json.JSONObject;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import service.FaceService;
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

@Controller
@RequestMapping("/face")
public class FaceController {
	
	public static final String APP_ID = "10118462";
	public static final String SECRET_ID = "AKIDxmPqbFq9NPp6E9CUt9EBwVCKJ5e1plAH";
	public static final String SECRET_KEY = "9IJ9qOl04xfFertlTzNcgYFl4oPqKenl";
	public static final String USER_ID = "398702042";
	
	@Autowired
	private FaceService service;
	
	@RequestMapping("/query")
	public String query(Face face, Model model) {
		List<Face> faces = this.service.query(face);
		model.addAttribute("faces", faces);
		return "/admin/queryFace.jsp";
	}
	
	@RequestMapping("/queryOne")
	public List<Face> queryOne(int id) {
		List<Face> faces = this.service.queryOne(id);
		return faces;
	}
	
	@RequestMapping("/delete")
	public String delete(Integer faceID) {
		int tag = this.service.delete(faceID);
		if(tag!=0)
			System.out.println("删除图像成功！");
		return "/admin/queryFace.jsp";
	}
	
	
	public String getRandomString(int length) { //length表示生成字符串的长度  
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";     
        Random random = new Random();     
        StringBuffer sb = new StringBuffer();     
        for (int i = 0; i < length; i++) {     
            int number = random.nextInt(base.length());     
            sb.append(base.charAt(number));     
        }     
        return sb.toString();     
     }    
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)  
	public String postAdd(Face face,MultipartFile photo, HttpServletRequest request) throws Exception{
		
		System.out.println("userID:"+face.getUser().getUserID());
		StringBuffer path = new StringBuffer();
		path.append(FaceController.class.getClassLoader().getResource("../../resources/faces").getPath());
		String oldName = photo.getOriginalFilename();
		String newName = UUID.randomUUID().toString() + oldName.substring(oldName.lastIndexOf("."));
		String realPath=path+newName;
		File dest = new File(realPath);
		System.out.println("newFile:"+realPath);
		photo.transferTo(dest);
		String savaPath="/ins/resources/faces/"+newName;
		face.setUrl(savaPath);
		int result = this.service.insert(face);
		System.out.println("result:::"+result);
		return "/admin/insertFace.jsp";

	}
	
	@RequestMapping(value="/faceRec",method=RequestMethod.POST)
	@ResponseBody
	public String faceRec(String img,Integer id) throws Exception{
		System.out.println("id:"+id);
		String path = FaceController.class.getClassLoader().getResource("../../resources/faces/test.png").getPath();
		BASE64Decoder decoder = new BASE64Decoder();    
        byte[] b = decoder.decodeBuffer(img);    
        ByteArrayInputStream bais = new ByteArrayInputStream(b);    
        BufferedImage bi = ImageIO.read(bais);    
        File w2 = new File(path);    
        ImageIO.write(bi,"png",w2);
        
        
        try {
			Youtu faceYoutu = new Youtu(APP_ID, SECRET_ID, SECRET_KEY,Youtu.API_YOUTU_END_POINT,USER_ID);
			
			JSONObject re;
			StringBuffer path2 = new StringBuffer();
			path2.append(FaceController.class.getClassLoader().getResource("../../resources/faces").getPath());
			//respose= faceYoutu.FaceCompareUrl("http://open.youtu.qq.com/content/img/slide-1.jpg","http://open.youtu.qq.com/content/img/slide-1.jpg");
			//respose = faceYoutu.DetectFace("test.jpg",1);
			List<Face> faces = this.service.queryOne(id);
			double max=0.0;
			String result=null;
			
			if(faces.size()==0) {
				String str = "{\"similarity\":\"-1\"}";    
				System.out.println("noface");
				return str;
			}
			
			for(Face f : faces) {
				System.out.println(f.toString());
				String str = f.getUrl().substring(21);
				System.out.println(str);
				path2.append(str);
				
				re = faceYoutu.FaceCompare(path, path2.toString());
				System.out.println(re);
				System.out.println(re.get("similarity"));
				
				double simi = Double.parseDouble(re.get("similarity").toString());
				if(simi>max) {
					max = simi;
					result = re.toString();
				}
			}
			
			
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
        
        
        //String result = "success";
		//return result;
		
	}

}
