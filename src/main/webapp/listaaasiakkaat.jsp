<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" name="viewport"
	content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/tyylit.css" rel="stylesheet">
<title>Asiakkaat</title>
</head>
<body>
	<p></p>
	<h1 class="container">Asiakkaat</h1>
	<p></p>

	<div class="container">

		<form action="haeasiakkaat" method="get"
			class="row g-3 align-items-center">
			<div class="col-md-10">
				<input class="form-control" type="text" id="hakusana"
					name="hakusana" value="${param['hakusana']}" placeholder="Hakusana">
			</div>
			<div class="col-md">
				<input class="btn btn-dark btn-lg" type="submit" value="hae" id="hakunappi">
			</div>

			<div class="mt-5">
				<table class="table table-dark table-striped" id="lista">
					<thead>
						<tr>
							<th colspan="5" class="oikealle"><a href = "lisaaasiakas.jsp"
								id="uusiAsiakas" class= "linkki">Lisää uusi asiakas</a></th>
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
						<c:forEach items="${asiakkaat}" var="listItem">
							<tr>
								<td>${listItem.etunimi}</td>
								<td>${listItem.sukunimi}</td>
								<td>${listItem.puhelin}</td>
								<td>${listItem.sposti}</td>
								<td align="right"><a href="muutaasiakas?asiakas_id=${listItem.asiakas_id}"
									class="btn bg-white text-dark btn-xs">Muuta</a> <a onclick="poista('${listItem.asiakas_id}')"
									class="btn bg-danger text-white">Poista</a></td>
							</tr>
						</c:forEach>
					</tbody>


				</table>
			</div>
		</form>
	</div>


	<script>
	function poista(asiakas_id){
		if(confirm("Haluatko varmasti poistaa asiakkaan "+ asiakas_id + "?")){
			document.location="poistaasiakas?asiakas_id="+asiakas_id;
		}
	}	
	</script>

</body>
</html>


