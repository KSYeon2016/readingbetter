package kr.ac.readingbetter.util;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import kr.ac.readingbetter.vo.BuyBookVo;

public class NaverParser {
	public static String getContent(Element element, String tagName){
		NodeList list = element.getElementsByTagName(tagName);
		Element cElement = (Element)list.item(0);
		
		if(cElement.getFirstChild() != null){
			return cElement.getFirstChild().getNodeValue();
		} else {
			return "";
		}
	}
	
	public List<BuyBookVo> parse(InputStream content){
		List<BuyBookVo> buyBookList = new ArrayList<>();
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		
		try {
			DocumentBuilder builder = dbf.newDocumentBuilder();
			Document doc = builder.parse(content);
			Element root = doc.getDocumentElement();
			NodeList list = root.getElementsByTagName("item");
			
			for(int i = 0; i < list.getLength(); i++){
				Element element = (Element)list.item(i);
				BuyBookVo vo = new BuyBookVo();
				
				vo.setProductType(getContent(element, "productType"));
				
				if(vo.getProductType().equals("1") || vo.getProductType().equals("2") || vo.getProductType().equals("3") || vo.getProductType().equals("4") || vo.getProductType().equals("5") || vo.getProductType().equals("6")){
					vo.setTitle(getContent(element, "title"));
					vo.setImage(getContent(element, "image"));
					vo.setLink(getContent(element, "link"));
					vo.setLprice(getContent(element, "lprice"));
					vo.setMallName(getContent(element, "mallName"));
					
					buyBookList.add(vo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return buyBookList;
	}
}
