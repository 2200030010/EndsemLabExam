<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JFSD</title>
</head>
<body>
	<div style="width:100%">
		<table style="width:100%">
			<tr>
				<td style="width:100px">Customer ID*</td>
				<td><input type="text" id="T1" /></td>
			</tr>
			<tr>
				<td style="width:100px">Customer Name*</td>
				<td><input type="text" id="T2" /></td>
			</tr>
			<tr>
				<td style="width:100px">Email*</td>
				<td><input type="text" id="T3" /></td>
			</tr>
			<tr>
				<td style="width:100px">Address*</td>
				<td><input type="text" id="T4" /></td>
			</tr>
			<tr>
				<td style="width:100px">Date of birth*</td>
				<td><input type="text" id="T5" /></td>
			</tr>
			<tr>
				<td style="width:100px"></td>
				<td> 
					<button onclick="save()">Save</button> 
					<button onclick="read()">Read</button>
					
				</td>
			</tr>
			<tr>
				<td></td>
				<td> <label id="L1"></label> </td>
			</tr>
		</table>
	</div>
	<div id='flist' style="width:100%"></div>
</body>
<script src="js/main.js"></script>
<script>
	function save()
	{
		var T1 = document.getElementById("T1");
		var T2 = document.getElementById("T2");
		var T3 = document.getElementById("T3");
		var T4 = document.getElementById("T4");
		var T5 = document.getElementById("T5");
		
		var data = JSON.stringify({
			id : T1.value,
			name : T2.value,
			email: T3.value,
			address:T4.value,
			dob:T5.value
		});
		
		var url = "http://localhost:8080/customer/save";
		callApi("POST", url, data, saveHandler);
	}
	function saveHandler(response)
	{
		//alert(response.msg);
		if(response.code == "200")
			L1.style.color = "green";
		else
			L1.style.color = "red";
		L1.innerHTML = response.msg;
	}
	function read() {
		var url = "http://localhost:8080/customer/read";
		callApi("GET", url, "", readHandler);
	}
	function readHandler(response) {
		var data = response;
		var table = `<table border="1">
						<tr>
							<th>Customer ID</th>
							<th>CustomerName</th>
							<th>Email</th>
							<th>Address</th>
							<th>DOB</th>
							
						</tr>`;
		for(var x in data){
			table += `<tr>
							<td>`+ data[x].id +`</td>
							<td>`+ data[x].name +`</td>
							<td>`+ data[x].email +`</td>
							<td>`+ data[x].address +`</td>
							<td>`+ data[x].dob +`</td>
					  </tr>`;
		}
		table += `</table>`;
		flist.innerHTML = table;
	}
	
</script>
</html>