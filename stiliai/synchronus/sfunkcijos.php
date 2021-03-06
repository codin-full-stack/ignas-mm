<?php
//Atvaizduojame remonto pranešimą
function remontas( $pavadinimas, $tekstas ) {

	global $conf, $lang;
	echo "<div id='plotis'>
    <div id='kaire'><div class='skalpas'>
    <a href='" . adresas() . "' title='" . adresas() . "'>
    <div class='logo'></div>
    </a>
    <div class='sonas2'></div>
    </div>
	</div>
    <div id='kunas'>
    <div id='meniu_juosta'></div>
    <div id='centras' style='width: 675px;min-height:300px;'>
    <div class='pavadinimas'>{$pavadinimas}</div>
    <div class='vidus'>
    <div class='text'>{$tekstas}</div>
    </div>
    </div>
    <div class='sonas'></div>
    <div id='kojos'>
    <div class='tekstas'>" . $conf['Copyright'] . "</div>
    <a href='http://mightmedia.lt' target='_blank' title='Mightmedia'><div class='logo'></div></a>
    </div>
    </div>
    </div>
    <div id='another' class='clear'><div class='lygiuojam'><div class='taisom'></div></div></div>
	";
}

//Dešinės pozicijos blokai
//Jeigu neprireikia paliekame taip.
function lentele_r( $pavadinimas, $tekstas, $label = FALSE ) {
	?>
	<section>
		<header>
			<h2>
				<?php echo $pavadinimas; ?>
			</h2>
		</header>
		<?php echo $tekstas; ?>
	</section>
	<?php
}

//Kairės pozicijos blokai
function lentele_l( $pavadinimas, $tekstas, $label = FALSE ) {
	?>
	<section>
		<header>
			<h2>
				<?php echo $pavadinimas; ?>
			</h2>
		</header>
		<?php echo $tekstas; ?>
	</section>
	<?php
}

//Naujienų, straipsnių lentelė
function lentele_c( $pavadinimas, $tekstas, $n_nuoroda, $kom_kiekis = FALSE, $datai = FALSE, $autorius = FALSE, $reitingai = FALSE ) {

//Jei naudosim kalbystę ištraukiam $lang, jei ne ištrinam.
	global $lang, $page;
//Tvarkome skaitymo nuorodas
//$kom_kiekis - komentarų skaičius, $n_nuoroda - nuoroda skaitymui
	$data = date( 'Y-m-d', $datai );
//Naujienų
	if ( 'naujienos' == str_replace( 'puslapiai/', '', $page ) ) {
		$skaitom = "<a href='{$n_nuoroda}'>{$lang['news']['read']} • {$lang['news']['comments']}({$kom_kiekis})</a>";
//Straipsnių
	} else {
		$skaitom = "<a href='{$n_nuoroda}'>{$lang['article']['read']}({$kom_kiekis})</a>";
	}
//Atvaizduojame
?>

<section>
	<header>
		<h2>
			<a href="<?php echo $n_nuoroda; ?>"><?php echo $pavadinimas; ?></a>
		</h2>
	</header>
	<?php echo $reitingai . $tekstas; ?>
</section>

<?php
}

//Centrinės pozicijos blokai
function lentele( $pavadinimas, $tekstas, $reitingai = FALSE ) {
	?>

	<section>
		<header>
			<h2>
				<?php echo $pavadinimas; ?>
			</h2>
		</header>
		<?php echo $reitingai . $tekstas; ?>
	</section>
	
	<?php
}

//Atvaizduojame klaidos pranešimą
function klaida( $pavadinimas, $tekstas, $label = FALSE ) {

	echo "<div class='klaida'><div class='info_ikona'></div>
    <div class='info_pavadinimas'>" . ucfirst( $pavadinimas ) . " <blink>!</blink></div>
    <div class='info_tekstas'>{$tekstas}</div>
    </div>";
}

//Atvaizduojame įvykdymo pranešimą
function msg( $pavadinimas, $tekstas, $label = FALSE ) {

	echo "<div class='msg'><div class='info_ikona'></div>
    <div class='info_pavadinimas'>" . ucfirst( $pavadinimas ) . "</div>
    <div class='info_tekstas'>{$tekstas}</div>
    </div>";
}

//Atvaizduojame Copyright
function copyright( $tekstas ) {

	global $mysql_num;
	echo $tekstas . ' ' . ( defined( 'LEVEL' ) && LEVEL == 1 ? 'MySQL: ' . $mysql_num : '' );
}

//Meniu bloko SUB MENIU funkcija
function th_meniu( $array, $start = '', $end = '' ) {

	$return = $start . "\n";
	foreach ( $array as $key => $val ) {
		if ( is_array( $val ) ) {
			$return .= "\t<li>$key\n";
			$return .= "\t<ul>\n\t";
			$return .= "\t" . th_meniu( $val );
			$return .= "\t</ul></li>\n";
		} else {
			$return .= "\t<li><a href='$val'>$key</a></li>\n";
		}
	}
	return $return . "\n" . $end;
}

//BB Kodai
function bbk( $forma ) {

	$return = "
<button onclick=\"addText('$forma', '[b]', '[/b]'); return false;\" title=\"B\"><img src=\"images/icons/edit-bold.png\"></button>
<button onclick=\"addText('$forma', '[i]', '[/i]'); return false;\" title=\"I\"><img src=\"images/icons/edit-italic.png\"></button>
<button onclick=\"addText('$forma', '[u]', '[/u]'); return false;\" title=\"U\"><img src=\"images/icons/edit-underline.png\"></button>
<button onclick=\"addText('$forma', '[big]', '[/big]'); return false;\" title=\"BIG\"><img src=\"images/icons/edit-heading-1.png\"></button>
<button onclick=\"addText('$forma', '[sm]', '[/sm]'); return false;\" title=\"SM\"><img src=\"images/icons/edit-heading-5.png\"></button>
<button onclick=\"addText('$forma', '[quote]', '[/quote]'); return false;\" title=\"QUOTE\"><img src=\"images/icons/edit-quotation.png\"></button> 
<button onclick=\"addText('$forma', '[left]', '[/left]'); return false;\" title=\"LEFT\"><img src=\"images/icons/edit-alignment.png\"></button> 
<button onclick=\"addText('$forma', '[center]', '[/center]'); return false;\" title=\"CENTER\"><img src=\"images/icons/edit-alignment-center.png\"></button> 
<button onclick=\"addText('$forma', '[justify]', '[/justify]'); return false;\" title=\"JUSTIFY\"><img src=\"images/icons/edit-alignment-justify.png\"></button> 
<button onclick=\"addText('$forma', '[right]', '[/right]'); return false;\" title=\"RIGHT\"><img src=\"images/icons/edit-alignment-right.png\"></button> 
<button onclick=\"addText('$forma', '[code]', '[/code]'); return false;\" title=\"Code\"><img src=\"images/icons/edit-code.png\"></button> 
<button onclick=\"addText('$forma', '[url]', '[/url]'); return false;\" title=\"URL\"><img src=\"images/icons/link.png\"></button>
<button onclick=\"addText('$forma', '[img]', '[/img]'); return false;\" title=\"IMG\"><img src=\"images/icons/picture.png\"></button>
";
	if ( $_SESSION[SLAPTAS]['level'] == 1 ) {
		$return .= "
<button onclick=\"addText('$forma', '[hide=Tik registruotiems]', '[/hide]'); return false;\" title=\"HIDE\"><img src=\"images/icons/eye.png\"></button>
";
	}
	return $return . "<br />";
}

function bbs( $forma ) {

	return smile( "
		:)
		(angel)
		:S
		 B)
		(draw)
		(eek)
		(evil)
		;(
		(green)
		:D
		xD
		:3
		:*
		(angry)
		$)
		8)
		:|
		:P
		(blush)
		:(
		(zzz)
		:O
		(snowman)
		", $forma ) . "<br/>";
}

//Šypsenėlės
function smile( $data, $bb = FALSE ) {

	$smilies = array(
		':)'        => 'smiley.png',
		'(angel)'   => 'smiley-angel.png',
		':S'        => 'smiley-confuse.png',
		'B)'        => 'smiley-cool.png',
		'(draw)'    => 'smiley-draw.png',
		'(eek)'     => 'smiley-eek.png',
		'(evil)'    => 'smiley-evil.png',
		';('        => 'smiley-cry.png',
		':D'        => 'smiley-grin.png',
		'xD'        => 'smiley-lol.png',
		':3'        => 'smiley-kitty.png',
		':*'        => 'smiley-kiss.png',
		'(angry)'   => 'smiley-mad.png',
		'$)'        => 'smiley-money.png',
		'8)'        => 'smiley-nerd.png',
		':|'        => 'smiley-neutral.png',
		':P'        => 'smiley-razz.png',
		'(blush)'   => 'smiley-red.png',
		':('        => 'smiley-sad.png',
		'(zzz)'     => 'smiley-sleep.png',
		'(green)'   => 'smiley-mr-green.png',
		'(snowman)' => 'snowman-hat.png',
		':O'        => 'smiley-surprise.png', );
	foreach ( $smilies as $smile => $image ) {
		//$data = str_replace($smile,"<img src='images/smiles/$image' alt='".$smile."' class='middle' ".(($bb)?"onclick=\"addText('".$bb."','".$smile."',' ');\" style='cursor: pointer;'":"")." />",$data);
		$data = str_replace( $smile, "<img title='{$smile}' src='images/smiles/{$image}' alt='" . $smile . "' class='middle' onclick=\"addText('" . $bb . "','" . $smile . "',' ');\" style='cursor: pointer;' />", $data );
	}
	return $data;
}

//bbcodo varijantas 1
function bb2html( $Input ) {

	$Bbcode = array( '/\[b\](.+?)\[\/b\]/i', '/\[i\](.+?)\[\/i\]/i', '/\[quote\](.+?)\[\/quote\]/i', '/\[url=(.+?)\](.+?)\[\/url\]/i' );
	$Html   = array( '<strong>$1</strong>', '<em>$1</em>', '<blockquote>$1</blockquote>', '<a href="$1">$2</a>' );
	return preg_replace( $Bbcode, $Html, $Input );
}


// bbcode

function nl2br2( $text ) {

	return str_replace( '<br />', '', $text );
}

function htmlspecialchars2( $text ) {

	static $patterns, $replaces;
	if ( !$patterns ) {
		$patterns = array( '#&lt;#', '#&gt;#', '#&amp;#', '#&quot;#' );
		$replaces = array( '<', '>', '&', '"' );
	}
	return preg_replace( $patterns, $replaces, $text );
}

function bbchat( $str ) {

	//$str=htmlspecialchars(trim($str));
	$str = descript( $str );
	// paryskinam teksta
	$str = preg_replace( "#\[b\](.*?)\[/b\]#si", "<b>\\1</b>", $str );
	// Paverciam teksta
	$str = preg_replace( "#\[i\](.*?)\[/i\]#si", "<i>\\1</i>", $str );
	// Pabraukiam teksta
	$str = preg_replace( "#\[u\](.*?)\[/u\]#si", "<u>\\1</u>", $str );
	// Mazas sriftas
	$str = preg_replace( "#\[sm\](.*?)\[/sm\]#si", "<small>\\1</small>", $str );
	// Specialus simboliai
	$str = str_replace( '&amp;plusmn;', '&plusmn;', $str );
	$str = str_replace( '&amp;trade;', '&trade;', $str );
	$str = str_replace( '&amp;bull;', '&bull;', $str );
	$str = str_replace( '&amp;deg;', '&deg;', $str );
	$str = str_replace( '&amp;copy;', '&copy;', $str );
	$str = str_replace( '&amp;reg;', '&reg;', $str );
	$str = str_replace( '&amp;hellip;', '&hellip;', $str );
	$str = str_replace( '&amp;#8230;', '&hellip;', $str );
	// Konvertuojam naujas eilutes i <br/>
	$str = nl2br( $str );
	//padarom grazias kabutes
	$str = preg_replace( "#\&quot;(.+?)\&quot;#si", "<q>\\1</q>", $str );
	//$str = preg_replace("/\"(.+?)\"/i", "<q>\\1</q>", $str);

	// js
	$str = preg_replace_callback( "#\<(.*?)javascript(.*?)\>#si", "bbcode_js", $str );

	return $str;
}

function bbcode( $str ) {

	global $lang;
	// Problemos su \ slashais
	//$str=str_replace("\\","&#92;",$str);
	//$str = preg_replace('&','#&amp;#',$str);
	$str = input( $str );
	$str = preg_replace_callback ( "#\[code\](.*?)\[\/code\]#si", function(){ return base64encode('<textarea name=\"code\" class=\"code\">\\1</textarea>');}, $str );
	$str = preg_replace_callback ( "#\[php\](.*?)\[\/php\]#si", function(){ return base64encode('<textarea name=\"code\" class=\"php\" rows=\"15\" cols=\"100\">\\1</textarea>');}, $str );
	$str = preg_replace_callback ( "#\[mirc\](.*?)\[\/mirc\]#si", function(){ return base64encode('<textarea name=\"code\" class=\"mirc\" rows=\"15\" cols=\"100\">\\1</textarea>');}, $str );
	$str = preg_replace_callback ( "#\[html\](.*?)\[\/html\]#si", function(){ return base64encode('<textarea name=\"code\" class=\"html\" rows=\"15\" cols=\"100\">\\1</textarea>');}, $str );
	$str = preg_replace_callback ( "#\[css\](.*?)\[\/css\]#si", function(){ return base64encode('<textarea name=\"code\" class=\"css\" rows=\"15\" cols=\"100\">\\1</textarea>');}, $str );
	$str = preg_replace_callback ( "#\[js\](.*?)\[\/js\]#si", function(){ return base64encode('<textarea name=\"code\" class=\"js\" rows=\"15\" cols=\"100\">\\1</textarea>');}, $str );
	$str = preg_replace_callback ( "#\[sql\](.*?)\[\/sql\]#si", function(){ return base64encode('<textarea name=\"code\" class=\"sql\" rows=\"15\" cols=\"100\">\\1</textarea>');}, $str );

	// Atverciam linka naujame lange
	$str = preg_replace( "#\[url\](.*?)?(.*?)\[/url\]#si", "<A HREF=\"\\1\\2\" TARGET=\"_blank\" rel=\"nofollow\" >\\1\\2</A>", $str );
	$str = preg_replace( "#\[url=(.*?)?(.*?)\](.*?)\[/url\]#si", "<A HREF=\"\\2\" TARGET=\"_blank\"  rel=\"nofollow\" >\\3</A>", $str );

	// Atverciam linka tame paciame lange
	$str = preg_replace( "#\[url2\](.*?)?(.*?)\[/url2\]#si", "<A HREF=\"\\1\\2\" rel=\"nofollow\">\\1\\2</A>", $str );
	$str = preg_replace( "#\[url2=(.*?)?(.*?)\](.*?)\[/url2\]#si", "<A HREF=\"\\2\" rel=\"nofollow\">\\3</A>", $str );

	// Automatiskai konvertuojam nuorodas
	$str = preg_replace_callback( "#([\n ])([a-z]+?)://([a-z0-9\-\.,\?!%\*_\#:;~\\&$@\/=\+]+)#si", "bbcode_autolink", $str );
	//$str = preg_replace("#([\n ])www\.([a-z0-9\-]+)\.([a-z0-9\-.\~]+)((?:/[a-z0-9\-\.,\?!%\*_\#:;~\\&$@\/=\+]*)?)#i", " <a href=\"http://www.\\2.\\3\\4\" target=\"_blank\">www.\\2.\\3\\4</a>", $str);
	$str = preg_replace( "#([\n ])([a-z0-9\-_.]+?)@([\w\-]+\.([\w\-\.]+\.)?[\w]+)#i", "\\1<a href=\"javascript:mailto:mail('\\2','\\3');\">\\2_(at)_\\3</a>", $str );

	// Slepti tekstui - rodomas tik registruotiems vartotojams
	$str = preg_replace_callback( "#\[hide=\"?(.*?)\"?\](.*?)\[/hide]#si", 'ukryj', $str );

	// Paryskinam teksta
	$str = preg_replace( "#\[b\](.*?)\[/b\]#si", "<b>\\1</b>", $str );

	// Paverciam teksta
	$str = preg_replace( "#\[i\](.*?)\[/i\]#si", "<i>\\1</i>", $str );

	// Pabraukiam teksta
	$str = preg_replace( "#\[u\](.*?)\[/u\]#si", "<u>\\1</u>", $str );

	// Mazas tekstas
	$str = preg_replace( "#\[sm\](.*?)\[/sm\]#si", "<small>\\1</small>", $str );

	// Didelis tekstas
	$str = preg_replace( "#\[big\](.*?)\[/big\]#si", "<big>\\1</big>", $str );

	// Centruojam
	$str = preg_replace( "/\[center\](.*?)\[\/center\]/si", "<div style=\"text-align:center;\">\\1</div>", $str );

	// Kaire
	$str = preg_replace( "/\[left\](.*?)\[\/left\]/si", "<div style=\"text-align:left;\">\\1</div>", $str );

	// Desine
	$str = preg_replace( "/\[right\](.*?)\[\/right\]/si", "<div style=\"text-align:right;\">\\1</div>", $str );

	// Lygiuojam
	$str = preg_replace( "/\[justify\](.*?)\[\/justify\]/si", "<div style=\"text-align:justify;\">\\1</div>", $str );

	// Spalvojam teksta
	$str = preg_replace( "#\[color=(http://)?(.*?)\](.*?)\[/color\]#si", "<span style=\"color:\\2\">\\3</span>", $str );

	// Rodom paveiksliuka
	$str = preg_replace( "/\[img\](http:\/\/[^\s'\"<>]+(\.gif|\.jpeg|\.jpg|\.png))\[\/img\]/", "<a class=\"fancybox-effects-d\" title=\"{$lang['admin']['preview']}\" href=\"\\1\"><img border=0 class=\"forum_img\" src=\"\\1\" alt=\"pic\" onError=\"this.src='images/icons/nopic.png';this.style.border='1px dashed red';this.style.margin='5px';this.style.padding='5px'\"></a>", $str );
	$str = preg_replace( "/\[img\](http:\/\/[^\s'\"<>]+(\.GIF|\.JPEG|\.JPG|\.PNG))\[\/img\]/", "<a class=\"fancybox-effects-d\" title=\"{$lang['admin']['preview']}\" href=\"\\1\"><img border=0 class=\"forum_img\" src=\"\\1\" alt=\"pic\" onError=\"this.src='images/icons/nopic.png';this.style.border='1px dashed red';this.style.margin='5px';this.style.padding='5px'\"></a>", $str );

	// [img=http://www/image.gif]
	$str = preg_replace( "/\[img=(http:\/\/[^\s'\"<>]+(\.gif|\.jpg|\.png))\]/", "<img border=0 src=\"\\1\">", $str );
	$str = preg_replace( "/\[img=(http:\/\/[^\s'\"<>]+(\.GIF|\.JPG|\.PNG))\]/", "<img border=0 src=\"\\1\">", $str );

	// Cituojam
	//$str = preg_replace("#\[quote\](.*?)\[/quote]#si", "<p class=\"cytat\"><u><b>Citata:</b></u><br/>\\1</p>", $str);
	if ( preg_match( '#\[quote\](.*?)\[/quote]#si', $str ) ) {
		$str = preg_replace( '#\[quote=(&quot;|"|\'|)(.*)\\1\]#seU', '"<div class=\"cytat\"><u><b>".str_replace(\'[\', \'&#91;\', \'$2\')." rašė:</b></u><br/>"', $str );
		$str = str_replace( '[quote]', "<p class=\"cytat\"><u><b>Citata:</b></u><br/>", $str );
		$str = str_replace( '[/quote]', '</p>', $str );
	}

	// Cituojam autoriu
	$str = preg_replace( "#\[quote=(http://)?(.*?)\](.*?)\[/quote]#si", "<p class=\"cytat\"><u><b>\\2 rašė:</b></u><br/>\\3</p>", $str );

	// Sarašas
	$str = preg_replace( "#\[list\](.*?)\[/list\]#si", "<ul>\\1</ul>", $str );
	$str = preg_replace( "#\[list=(http://)?(.*?)\](.*?)\[/list\]#si", "<ol type=\"\\2\">\\3</ol>", $str );
	$str = preg_replace( "#\[\*\](.*?)\\s#si", "<li>\\1</li>", $str );

	// Atvaizduojam emailą
	$str = preg_replace( "#\[email\]([a-z0-9\-_.]+?)@([\w\-]+\.([\w\-\.]+\.)?[\w]+)\[/email\]#i", "<a href=\"mailto:\\1@\\2\">\\1@\\2</a>", $str );

	// HTML formavimas
	$str = nl2br( $str );
	$str = str_replace( "[br]", "<br/>", $str );
	$str = smile( $str );

	// Iskvieciam kodu atvaizdavima
	$str = preg_replace_callback( "#\<base64\>(.*?)\</base64\>#si", "base64decode", $str );

	return $str;
}

// Atkoduojam koda
function base64decode( $str ) {

	return base64_decode( $str[1] );
}

// Užkoduojam kodą
function base64encode( $str ) {

	return "<base64>" . base64_encode( $str ) . "</base64>";
}

// Teksto slepimui
function ukryj( $match ) {

	$id     = uniqid( '' );
	$return = ( defined( "LEVEL" ) && LEVEL > 0 ) ? $match[2] : 'Tik registruotiems vartotojams';
	return '<font color="red">▲</font> <a href="#" onclick="flip(\'' . $id . '\'); return false;"><b>' . $match[1] . '</b> <font color="red">▼</font></a><div id="' . $id . '" class="ukryj" style="display: none;">' . $return . '</div>';
}

// Emailo apsauga
function bbcode_js( $str ) {

	if ( !eregi( '<a href=\"javascript:mailto:mail\(\'', $str[0] ) ) {
		return str_replace( 'javascript', 'java_script', $str[0] );
	} else {
		return $str[0];
	}
}

// nuorodos kode
function bbcode_autolink( $str ) {

	$lnk = $str[3];
	if ( strlen( $lnk ) > 30 ) {
		if ( substr( $lnk, 0, 3 ) == 'www' ) {
			$l = 9;
		} else {
			$l = 5;
		}
		$lnk = substr( $lnk, 0, $l ) . '...' . substr( $lnk, strlen( $lnk ) - 8 );
	}
	return ' <a href="' . $str[2] . '://' . $str[3] . '" target="_blank" class="link"> ' . $str[2] . '://' . $lnk . ' </a>';
}

// Jei zmogus perkele teksta i kita eilute tai taip ir atvaizduojam
function lauzymas( $txt ) {
	//return str_replace("\r\n", "<br>", $txt);
}

?>
