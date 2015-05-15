<?php
header("Status: 400 Bad Request");

include("../settings/settings-default.php");
@include("../settings/settings.php");

?>
<html>
<head>
<title><?= $siteTitle; ?> - GeoConfirm</title>
<script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
<h1>Bist Du ein Mensch?</h1>

<p>Jeder Computer im Internet hat eine Adresse (IP-Adresse).</p>
<p>Andere Computer mit 
einer ähnlichen Adresse wie die Deine haben vor kurzem versucht unsere Webseite
zu attackieren. </p>
<p>Aus diesem Grund müssen wir sicherstellen, dass Du auch wirklich ein Mensch bist.</p>
<p>Fülle hierzu bitte einfach das Formular unten aus. Wenn der Code richtig ist, schalten
wir Dir den Zugang zu unserer Seite für 2 Stunden frei.</p>

<?php

if(strtolower($_SERVER["REQUEST_METHOD"]) == "post"){
var_dump($_POST);
}
?>

<form method="post" action="/">

<div class="g-recaptcha" data-sitekey="<?php echo $recaptchaSiteKey; ?>"></div>
<button type="submit">Ich bin ein Mensch!</button>
</form>

To Access this server from your IP range, we'll need to whitelist your IP address.
Contact us for further details: <a href="mailto:office@<?php echo $_SERVER["SERVER_ADDR"]; ?>">support</a>

</body>
</html>
