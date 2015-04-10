package com.tags;
import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;


public class RaizTag extends BodyTagSupport{

	private static final long serialVersionUID = 1L;

	public int doAfterBody() throws JspException {
		try{
			BodyContent bc = getBodyContent();
			double cuerpo = Double.parseDouble(bc.getString());
			JspWriter out = bc.getEnclosingWriter();
			if(cuerpo>=0){
				out.print("Ra�z cuadrada de "+cuerpo+"= "+Math.sqrt(cuerpo));
			}else{
				out.print("No existe la raiz cuadrada de un n�mero negativo");
			}
		}catch (IOException e){
			throw new JspException("Error: IOException"+e.getMessage());
		}
		return SKIP_BODY;
	}
}