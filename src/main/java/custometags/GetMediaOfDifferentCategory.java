package custometags;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;


import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import dao.StoreMediaInformationDao;

import javax.servlet.jsp.JspException;
import java.io.IOException;
import java.util.*;
import dto.Media;
import dto.MediaInfo;

/*JspContext
1. This is an abstract and parent class for pageContext class. 
2. This abstracts all the information that is not specific to servlet. 

PageContext. 
1. This is an abstract class , child class of JspContext
*/


/*steps

1. get JspContext(absract class , parent class for PageContext) object
2. get PageContext(abstract class , child class of JspContext) object by explicit type converting from JspContext to PageContext
3. get HttpServletRequest object from page context object
4. get JspWriter object using jspContext object or we can also get from pageContext object
5. write the normal logic*/


public class GetMediaOfDifferentCategory extends SimpleTagSupport{

	private String category;
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Override
	public void doTag() throws JspException, IOException {
		
		// Get the JspContext associated with this tag
        JspContext jspContext = getJspContext();

        // Cast the JspContext to PageContext to access HttpServletRequest
        PageContext pageContext = (PageContext) jspContext;

        // Get the HttpServletRequest object from the PageContext
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();

        
		JspWriter out = jspContext.getOut();
		
		HashMap<String, ArrayList<Media>> map = (HashMap<String, ArrayList<Media>>)request.getAttribute("mediaMap");
		ArrayList<Media> list = map.get(category);
		for(int i = 0 ; i < 4 ; i++) {
			
			try {
				
				Media media = list.get(i);
				MediaInfo mediaInfo = StoreMediaInformationDao.getMediaAllInfo(media.getMedia_id());
				String src = "media-List-Image?id="+media.getMedia_id();
				int length = mediaInfo.getDiscription().length();
				String disc = "";
				if(length >= 80) {
					disc = mediaInfo.getDiscription().substring(0, 80);
				}
				else {
					disc = mediaInfo.getDiscription();
				}
				String id = media.getMedia_id();
				out.println("<div class='imagePoster'><img src='"+src+"' style='width: 100%; height: 200px; border-radius: 4px;'/><button class='btn btn-outline-light mt-3 mb-2' style='width: 90%; margin-left: auto; margin-right: auto; display: block;'>Watch Now</button><p class='text-light d-flex justify-content-between px-3'><span>"+mediaInfo.getRelease_date()+"</span><span>"+mediaInfo.getLength()+"</span><span>"+mediaInfo.getRatings()+"</span></p><p class='px-3 info' style='color : #605D6B;'>"+disc+"...</p><a href='get-all-info-media?id="+id+"' class='moreDetails' >More Details</a></div>");
				
			}
			catch(SQLException s) {
				
				s.printStackTrace();
				System.out.println("GetMediaOfDifferentCategory-CustomTag");
				
			}
			
		}
		
		
	}
	
}
