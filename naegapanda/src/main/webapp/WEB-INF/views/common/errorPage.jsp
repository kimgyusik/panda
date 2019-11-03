<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/style/errorEvent.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="icon" href="resources/pandaicon.ico">
<title>오류 페이지</title>
<style>
body {
  font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif; 
}
</style>
</head>
<body>

<script>
Swal.fire({
	  title: 'adfadfadsf',
	  width: 600,
	  padding: '3em',
	  background: '#fff url(https://sweetalert2.github.io/images/trees.png)',
	  backdrop: `
	    rgba(0,0,123,0.4)
	    url("https://sweetalert2.github.io/images/nyan-cat.gif")
	    center left
	    no-repeat
	  `
	})
</script>

	<h1 align="center">${ msg }</h1>
	
</body>
</html>