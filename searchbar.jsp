<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>OLX TYPE</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    	<!-- CUSTOM -->
    	<link href='https://fonts.googleapis.com/css?family=Oswald|Open+Sans' rel='stylesheet' type='text/css'>
    		
    		
     <link href="css/Custom.css" rel="stylesheet">
     	
     	<link href="css/font-awesome.min.css" rel="stylesheet">
     	<script type="text/javascript">
        function active() {
          var searchBar = document.getElementById('searchBar');
          if(searchBar.value == 'Search....'){
          	searchBar.value = ''
          	searchBar.placeholder = 'Search....'
          }
        }

         function inactive() {
          var searchBar = document.getElementById('searchBar');
          if(searchBar.value == ''){
          	searchBar.value = 'Search....'
          	searchBar.placeholder = ''
          }
        }

      </script>
</head>
<body>
<form action="" method="post">
	<input type="text" id="searchBar" name="searchbar" placeholder="" value="Search...." maxlength="30" autocomplete="off" onmousedown="active();" onblur="inactive();" /><input type="submit" id="searchBtn" value="GO !"  />
</form>

 
   <script src="js/jquery1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>