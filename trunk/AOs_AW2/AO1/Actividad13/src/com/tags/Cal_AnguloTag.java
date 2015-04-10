package com.tags;

import java.io.*;

import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

@SuppressWarnings("serial")
public class Cal_AnguloTag extends TagSupport {
	private float angulo;
	private String operacion;

	public void setAngulo(float angulo) {
		this.angulo = angulo;
	}

	public void setOperacion(String operacion) {
		this.operacion = operacion;
	}

	public int doStartTag() throws JspException {
		try {
			double b = Math.toRadians(angulo);
			if (operacion.equals("tangente")) {
				pageContext.getOut().print(
						"Tangente de " + angulo + " es: " + Math.tan(b));
			} else if (operacion.equals("coseno")) {
				pageContext.getOut().print(
						"Coseno de " + angulo + " es: " + Math.cos(b));
			} else if (operacion.equals("seno")) {
				pageContext.getOut().print(
						"Seno de " + angulo + " es: " + Math.sin(b));
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