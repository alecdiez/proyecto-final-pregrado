package com.tags;
import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;


public class Cal_Coseno extends BodyTagSupport{

	private static final long serialVersionUID = 1L;

	public int doAfterBody() throws JspException {
		try{
			BodyContent bc = getBodyContent();
			Double cuerpo = Double.parseDouble(bc.getString());
			JspWriter out = bc.getEnclosingWriter();
			out.print("Coseno ( "+cuerpo+") = "+Math.cos(cuerpo));
			
		}catch (IOException e){
			throw new JspException("Error: IOException"+e.getMessage());
		}
		return SKIP_BODY;
	}
}