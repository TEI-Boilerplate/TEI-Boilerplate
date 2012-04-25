<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>TEI Boilerplate</title>
	<meta name="generator" content="BBEdit 10.1" />
	<link  id="maincss" rel="stylesheet" type="text/css" href="../css/teibp.css" />
	<style type="text/css">
	html {
	margin-left: 4em;
  margin-right: 8em;
  padding: 2.5em;
  font-family: Cochin, Georgia, Serif;
  font-size: 14pt;
  background-color: #ebebeb;
  color: #292929;
  width: 36em;}
  
  h1, h2, h3, h4, h5, h6 {
  font-family: Arvo, sans-serif;
  font-weight: normal;
	}
h1 {
  font-size: 135%;
}
h2 {
  font-size: 120%;
}
h3 {
  font-size: 105%;
}
pre {
  font-size: 70%;
  border: dashed 1px #808080;
  padding: 1em;
  border-radius: 5px;
}
	</style>
	<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-31051795-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</head>
<body>
<div>
<div id="banner">
<img src="../images/teibp_logo.png" alt="TEI Boilerplate Logo" style="border:0;" />
<hr style="margin-bottom:.15em;" />
<div style="float:right"><a href="http://sourceforge.net/projects/teiboilerplate/files/">download</a> | <a href="../content/demo.xml">demo</a></div>
</div>
</div>
  <div id="content" style="height:500px"><h1>TEI Boilerplate Preview Tool</h1>
	<form enctype="multipart/form-data" action="<?php echo $_SERVER['PHP_SELF'];?>" method="POST">
    	<input type="hidden" name="MAX_FILE_SIZE" value="105000" />
    	Upload a valid TEI file to preview: <input name="userfile" type="file" />
    	<input type="submit" name="submit" value="upload" />
	</form>
<?php

if (isset($_POST['submit'])) {

	$allowedExtensions = array("txt","xml");
	foreach ($_FILES as $file) {
    	if ($file['tmp_name'] > '') {
      		if (!in_array(end(explode(".",
            	strtolower($file['name']))),
            	$allowedExtensions)) {
       			die($file['name'].' is not a valid file type.<br/>');
      		}
    	}
  	}

	$uploaddir = './';
	$uploadfile = $uploaddir . basename($_FILES['userfile']['name']);

	if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
    	echo "Your document is successfully uploaded.\n";
		$teibpcmd = "
	<?xml-stylesheet type=\"text/xsl\" href=\"teibp.xsl\"?>
	<TEI";

		$filetext = file_get_contents($uploadfile);
		$pattern = "/<TEI\b/";
		$file_bp = preg_replace($pattern,$teibpcmd,$filetext,1);
		file_put_contents($uploadfile, $file_bp);

		echo "<a href=\"".$uploadfile."\">Preview your TEI document here.</a>";
	} else {
    	echo "There was an error in the upload process. Make sure your ducument is less than 100KB and try again.\n";
	}	

	
}
?>

</div>

<div id="footer"> Powered by <a href="http://dcl.slis.indiana.edu/teibp/">TEI Boilerplate</a>. TEI Boilerplate is licensed under a <a href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0
				Unported License</a>. <a href="http://creativecommons.org/licenses/by/3.0/"><img alt="Creative Commons License" style="border-width:0;" src="http://i.creativecommons.org/l/by/3.0/80x15.png" /></a></div>
</body>
</html>
