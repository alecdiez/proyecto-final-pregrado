package com.tags;

import java.io.*;

import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

@SuppressWarnings("serial")
public class Raiz_CuadradaTag extends TagSupport {
	private float num1;
	
	
	public void setNum1(float num1) {
		this.num1 = num1;
	}	

	public int doStartTag() throws JspException {
		try {
			
			pageContext.getOut().print("Raiz Cuadrada del Número Entero ["+num1+"]= " + Math.sqrt(num1));
			
			
		} catch (IOException e) {
			throw new JspException("Error: IOException" + e.getMessage());
		}
		return SKIP_BODY;
	}

	public int doEndTag() throws JspException {
		return SKIP_PAGE;
	}
}