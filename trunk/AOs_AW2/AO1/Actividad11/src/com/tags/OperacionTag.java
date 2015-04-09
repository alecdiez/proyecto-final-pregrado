package com.tags;

import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

public class OperacionTag extends TagSupport {
	private int num1, num2;
	private String operacion;
	
	public void setOperacion(String operacion) {
		this.operacion = operacion;
	}

	public void setNum1(int num1) {
		this.num1 = num1;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}

	public int doStartTag() throws JspException {
		try {
			if(operacion.equals("suma")){
			pageContext.getOut().print("Suma ["+num1+" + "+num2+"]= " + (num1 + num2));
			}else if(operacion.equals("multiplica")){
				pageContext.getOut().print("Multiplica ["+num1+" * "+num2+"]= " + (num1 * num2));
			}else if(operacion.equals("divide")){
				pageContext.getOut().print("Divide ["+num1+" / "+num2+"]= " + (num1 / num2));
			}else if(operacion.equals("resta")){
				pageContext.getOut().print("Resta ["+num1+" - "+num2+"]= " + (num1 - num2));
			}
			
		} catch (IOException e) {
			throw new JspException("Error: IOException" + e.getMessage());
		}
		return SKIP_BODY;
	}

	public int doEndTag() throws JspException {
		return SKIP_PAGE;
	}
}