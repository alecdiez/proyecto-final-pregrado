<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad N� 9 AO2</title>
</head>
<script type="text/javascript">
	//clase vehiculo ************************************************
	function Vehiculo(modelo, marca, a�o) {
		this.modelo = modelo;
		this.marca = marca;
		this.a�o = a�o;
	}
	function Concesionaria(nombre, a�oTope) {
		this.nombre = nombre;
		this.a�oTope = a�oTope;
	}
</script>
<body>
	<h1>Actividad N� 9 - AO2</h1>
	<img alt="actividad9" src="act9.jpg">
	<form name="form1" action="index.jsp">
		<div align="center">
			<h2>
				<script type="text/javascript">
					var cont = 0;
					var vehiculos = [];
					while (fin != 'S') {
						var modelo;
						var modelo = prompt("Ingrese el modelo del vehiculo.",
								"");
						var marca = prompt("Ingrese la marca del vehiculo.", "");
						var a�o = prompt("Ingrese el a�o del vehiculo.", "");
						var fin = prompt('Desea finalizar?? S/N');
						vehiculos[cont] = new Vehiculo(modelo, marca, a�o);
						if (fin.length != 0) {
							fin = fin.toUpperCase();
						}

						cont++;
					}

					var concesionaria = new Concesionaria('Conse1', 2005);

					for (var i = 0; i < vehiculos.length; i++) {
						document.write('El vehiculo ingresado es....'
								+ vehiculos[i].modelo + ' - '
								+ vehiculos[i].marca + ' - ' + vehiculos[i].a�o
								+ '<br><br>');

						comparar(vehiculos[i], concesionaria);
					}

					function comparar(vehiculo, concesionaria) {
						if (vehiculo.a�o < concesionaria.a�oTope) {
							document
									.write('El vehiculo ..'
											+ vehiculo.marca
											+ ' '
											+ vehiculo.modelo
											+ ' con a�o de fabricacion: '
											+ vehiculo.a�o
											+ ' NO se puede vender en la Consecionaria ..'
											+ concesionaria.nombre + '<br><br>');
						} else {
							document.write('El vehiculo ..' + vehiculo.marca
									+ ' ' + vehiculo.modelo
									+ ' con a�o de fabricacion: '
									+ vehiculo.a�o
									+ ' Se puede vender en la Consecionaria ..'
									+ concesionaria.nombre + '<br><br>');
						}
					}
				</script>
			</h2>
		</div>
	</form>
</body>
</html>