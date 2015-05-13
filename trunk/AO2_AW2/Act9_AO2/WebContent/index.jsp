<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad N° 9 AO2</title>
</head>
<script type="text/javascript">
	//clase vehiculo ************************************************
	function Vehiculo(modelo, marca, año) {
		this.modelo = modelo;
		this.marca = marca;
		this.año = año;
	}
	function Concesionaria(nombre, añoTope) {
		this.nombre = nombre;
		this.añoTope = añoTope;
	}
</script>
<body>
	<h1>Actividad N° 9 - AO2</h1>
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
						var año = prompt("Ingrese el año del vehiculo.", "");
						var fin = prompt('Desea finalizar?? S/N');
						vehiculos[cont] = new Vehiculo(modelo, marca, año);
						if (fin.length != 0) {
							fin = fin.toUpperCase();
						}

						cont++;
					}

					var concesionaria = new Concesionaria('Conse1', 2005);

					for (var i = 0; i < vehiculos.length; i++) {
						document.write('El vehiculo ingresado es....'
								+ vehiculos[i].modelo + ' - '
								+ vehiculos[i].marca + ' - ' + vehiculos[i].año
								+ '<br><br>');

						comparar(vehiculos[i], concesionaria);
					}

					function comparar(vehiculo, concesionaria) {
						if (vehiculo.año < concesionaria.añoTope) {
							document
									.write('El vehiculo ..'
											+ vehiculo.marca
											+ ' '
											+ vehiculo.modelo
											+ ' con año de fabricacion: '
											+ vehiculo.año
											+ ' NO se puede vender en la Consecionaria ..'
											+ concesionaria.nombre + '<br><br>');
						} else {
							document.write('El vehiculo ..' + vehiculo.marca
									+ ' ' + vehiculo.modelo
									+ ' con año de fabricacion: '
									+ vehiculo.año
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