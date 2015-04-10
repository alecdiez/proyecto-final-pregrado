package com.tags;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

public class FactorTag extends BodyTagSupport {

	private static final long serialVersionUID = 1L;

	public int doAfterBody() throws JspException {
		try {
			BodyContent bc = getBodyContent();
			double cuerpo = Double.parseDouble(bc.getString());
			JspWriter out = bc.getEnclosingWriter();
			double[] valores = factorizar(cuerpo);
			out.print("Los factores primos son:  ");
			for (int i = 0; i <= valores.length - 1; i++) {
				out.print(valores[i] + "  /  ");
			}
		} catch (IOException e) {
			throw new JspException("Error: IOException" + e.getMessage());
		}
		return SKIP_BODY;
	}

	public double[] factorizar(double numero) {
		ArrayList listaPrimos = new ArrayList();

		if (numero <= 1) {
			throw new IllegalArgumentException("El número debe ser >= 2");
		}

		double aux = numero;
		int i = 2;

		while (aux != 1) {
			if (esPrimo(i)) {
				while (restoCero(aux, i)) {
					listaPrimos.add(new Integer(i));
					aux = aux / i;
				}
			}
			i++;
		}

		double[] resultado = new double[listaPrimos.size()];
		for (int j = 0; j < listaPrimos.size(); j++) {
			resultado[j] = ((Integer) listaPrimos.get(j)).intValue();
		}

		return resultado;
	}

	private boolean esPrimo(int p) {

		boolean res = true;
		for (int i = 2; i < p; i++) {
			if (restoCero(p, i)) {
				res = false;
			}
		}

		return res;
	}

	private boolean restoCero(double num, int p) {

		return (num % p == 0);
	}
}