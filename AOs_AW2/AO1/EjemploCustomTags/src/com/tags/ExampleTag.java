package com.tags;
import java.io.IOException;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

@SuppressWarnings("serial")
public class ExampleTag extends TagSupport {
	public int doStartTag() {
		try {
			JspWriter out = pageContext.getOut();
			out.print("ejemplo de custom tag");
		} catch (IOException ioe) {
			System.out.println("Error en ExampleTag: " + ioe);
		}
		return (SKIP_BODY);
	}
}