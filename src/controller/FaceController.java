package controller;

import org.json.JSONObject;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.List;
import javax.imageio.ImageIO;
import service.FaceService;
import sun.misc.BASE64Decoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.youtu.Youtu;

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
		return "/query2.jsp";
	}
	
	@RequestMapping("/queryOne")
	public List<Face> queryOne(int id) {
		List<Face> faces = this.service.queryOne(id);
		return faces;
	}
	
	
	@RequestMapping(value="/faceRec",method=RequestMethod.POST)
	@ResponseBody
	public String faceRec(String img,Integer id) throws Exception{
		System.out.println("img:"+img);
		System.out.println("id:"+id);
		String path = FaceController.class.getClassLoader().getResource("../../resources/faces/test.png").getPath();
		System.out.println(path);
		
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
			
			System.out.println("path2:"+path2);
			//respose= faceYoutu.FaceCompareUrl("http://open.youtu.qq.com/content/img/slide-1.jpg","http://open.youtu.qq.com/content/img/slide-1.jpg");
			//respose = faceYoutu.DetectFace("test.jpg",1);
			//respose = faceYoutu.DetectFace("zk2.jpg",1);
			List<Face> faces = this.service.queryOne(id);
			
			for(Face f : faces) {
				System.out.println(f.toString());
				String str = f.getUrl().substring(22);
				System.out.println(str);
				path2.append(str);
			}
			System.out.println("faceRec worked!");
			re = faceYoutu.FaceCompare(path, path2.toString());
			//get respose
			//System.out.println(respose);
			System.out.println(re);
			String result = re.toString();
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
        
        
        //String result = "success";
		//return result;
		
	}

}
