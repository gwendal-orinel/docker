<?php 
if(isset($_GET["q"])){ 

include_once( "simple_html_dom.php" );
	$key=$_GET["q"];
	$keyfin= ''. str_replace ( ' ', '+', $key) .'';
	$html = new simple_html_dom();
 
$google='https://www.google.fr/search?&tbm=isch&source=hp&biw=1536&bih=732&ei=2Pf8WYj-HcTTU5f7rsgD&q='.$keyfin; //&start=0
$bing='https://www.bing.com/images/search?q='.$keyfin.'&qs=n&form=QBLH&scope=images&sp=-1&pq='.$keyfin.'&sc=9-5&sk=&cvid=C39408ACCED742BB9D53A131CACF6AE4&count=50&FORM=IBASEP'; //&first=29
 
 //set engine search
 if(isset($_GET["engine"])){ 
	if($_GET["engine"]=="google"){
		$html=file_get_html($google);
		$engine="google";
	 }
	 if($_GET["engine"]=="bing"){
		$html=file_get_html($bing);
		$engine="bing";
	 }
 }else{
	$html=file_get_html($bing);
	$engine="bing";
 }

 //convert functions
function tojson($image,$liensource,$source,$width,$height,$format,$size){
	$tab = array('Image' => $image, 'Lien-Source' => $liensource, 'Source' => $source, 'Longueur' => $width, 'Hauteur' => $height, 'Format' => $format, 'Size' => $size);
	echo json_encode($tab);
}
		
function toimage($image,$liensource,$source,$width,$height,$format,$size){
	echo '<img height="'.$height.'" width="'.$width.'" src="'.$image.'" size="'.$size.'" title="Source '.$source.' " />';
}

//echo $html;
$loop=0;
if($engine=="google"){
	
	foreach($html->find('td[style=width:25%;word-wrap:break-word]') as $element){
		foreach($element->find('img') as $image){
			if(isset($_GET["width"])){ $width = $_GET["width"]; }else{ $width = $image->width; }
			if(isset($_GET["height"])){ $height = $_GET["height"]; }else{ $height = $image->height; }
			$image=$image->src;
		}
		foreach($element->find('cite') as $source){
			$source=$source->title;
		}
		foreach($element->find('a') as $liensource){
			$liensource=str_replace("url?q=", "", $liensource->href);
			$liensource=explode("&", $liensource);
			$liensource=$liensource[0];
		}
		$fileinfo = explode("<br>", $element->innertext);
		$fileinfo = explode("&times;", $fileinfo[3]);
		//$width=$fileinfo[0];
		$fileinfo = explode("-", $fileinfo[1]);
		//$height=$fileinfo[0];
		$size=str_replace("%&nbsp;%", "", $fileinfo[1]);
		if(isset($fileinfo[2])){
		$format=$fileinfo[2];
		str_replace("%&nbsp;%", "", $format); }else{ $format=''; }
					
		if(isset($_GET["count"])){ $count=$_GET["count"]; }else{ $count="20"; }
		if($loop < $count){
			if(isset($_GET["format"])){ 
				$view=$_GET["format"];
				if($view == "json"){
					tojson($image,$liensource,$source,$width,$height,$format,$size);
				}
				if($view == "html"){
					toimage($image,$liensource,$source,$width,$height,$format,$size);
				}
			}else{
				toimage($image,$liensource,$source,$width,$height,$format,$size);
			}
			$loop++;
		}	
	}
}
	
if($engine=="bing"){
	foreach($html->find('div[class=item]') as $element){
	 
		foreach($element->find('a[class=thumb]') as $image){
			$image=$image->href;
		}
		foreach($element->find('a[class=tit]') as $source){
			$liensource=$source->href;
			$source=$source->innertext;
		}
		foreach($element->find('div[class=fileInfo]') as $fileinfo){
			$fileinfo = explode(" ", $fileinfo->innertext);
			$format = $fileinfo[3];
			$size = $fileinfo[4];
			if(isset($_GET["width"])){ $width = $_GET["width"]; }else{ $width = $fileinfo[0]; }
			if(isset($_GET["height"])){ $height = $_GET["height"]; }else{ $height = $fileinfo[2]; }
		}
		
		if(isset($_GET["count"])){ $count=$_GET["count"]; }else{ $count="28"; }
		if($loop < $count){
			if(isset($_GET["format"])){ 
				$view=$_GET["format"];
				if($view == "json"){
					tojson($image,$liensource,$source,$width,$height,$format,$size);
				}
				if($view == "html"){
					toimage($image,$liensource,$source,$width,$height,$format,$size);
				}
			}else{
				toimage($image,$liensource,$source,$width,$height,$format,$size);
			}
			$loop++;
		}
	}
}
}else{ 
echo "<center>API Image by Gwendal </center></br></br>";
echo "Required: </br> please parse 'q' argument to make query : ?q=search+words </br></br>";
echo "Options: </br>
parse 'format' argument to change format (json|html) : ?q=search+words&format=json </br>
parse 'count' argument to change number ( max depend of search engine) : ?q=search+words&count=5 </br>
parse 'height' argument to change height unit same as css code (INT|auto): ?q=search+words&height=200px </br>
parse 'width' argument to change width unit same as css code (INT|auto): ?q=search+words&width=200px </br>
parse 'engine' argument to change search engine (bing|google): ?q=search+words&engine=bing </br>
";
}
	 
	 ?>
