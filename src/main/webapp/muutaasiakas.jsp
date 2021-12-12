<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" name="viewport"
	content="width=device-width, initial-scale=1">
<script src="scripts/main.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/tyylit.css" rel="stylesheet">
<title>Muuta asiakas</title>
</head>
<body>
	<p></p>
	<h1 class="container">Muuta asiakkaan tiedot</h1>
	<p></p>
	<div class="container">
		<form id="tiedot" action = "muutaasiakas" method = "post">
			<table class="table table-dark table-striped">
				<thead>
					<tr>
						<th colspan="5" class="oikealle"><a href = "listaaasiakkaat.jsp" class = "linkki">Takaisin listaan</a></th>
					</tr>
					<tr>
						<th>Etunimi</th>
						<th>Sukunimi</th>
						<th>Puhelin</th>
						<th>Sähköposti</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input class="form-control" type="text" name="etunimi" id="etunimi" value = "${asiakas.etunimi}"></td>
						<td><input class="form-control" type="text" name="sukunimi" id="sukunimi" value = "${asiakas.sukunimi}"></td>
						<td><input class="form-control" type="text" name="puhelin" id="puhelin" value = "${asiakas.puhelin}"></td>
						<td><input class="form-control" type="text" name="sposti" id="sposti" value = "${asiakas.sposti}"></td>
						<td><input class="btn bg-white text-dark" type="submit" id="tallenna" value="Muuta" onclick = "tarkista()"></td>
					</tr>
					<tr>
						<th colspan="5"></th>
					</tr>
					<tr>
						<th colspan="5"><span class="viesti" id="viesti"></span></th>
					</tr>
				</tbody>
			</table>
			<input type = "hidden" name = "asiakas_id" id = "asiakas_id" value = "${asiakas.asiakas_id}">
		</form>

	</div>
	<div class="container" id="viesti"></div>

</body>

<script>
function tarkasta(){
if(document.getElementById("etunimi").value.length<2){
	document.getElementById("viesti").innerHTML="Etunimi ei kelpaa!";
	return;
}else if(document.getElementById("sukunimi").value.length<2){
	document.getElementById("viesti").innerHTML="Sukunimi ei kelpaa!";
	return;
}else if(document.getElementById("puhelin").value.length<1){
	document.getElementById("viesti").innerHTML="Puhelinnumero ei kelpaa!";
	return;
}else if(document.getElementById("sposti").value.length<1){
	document.getElementById("viesti").innerHTML="Sähköposti ei kelpaa!";
	return;
}
document.getElementById("asiakas_id").value;
document.getElementById("etunimi").value=siivoa(document.getElementById("etunimi").value);
document.getElementById("sukunimi").value=siivoa(document.getElementById("sukunimi").value);
document.getElementById("puhelin").value=siivoa(document.getElementById("puhelin").value);
document.getElementById("sposti").value=siivoa(document.getElementById("sposti").value);
document.forms["tiedot"].submit();
}

function siivoa(teksti){
teksti=teksti.replace("<","");
teksti=teksti.replace(";","");
teksti=teksti.replace("'","''");
return teksti;
}
	
</script>
</html>