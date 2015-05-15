<?php
header("Status: 400 Bad Request");
?>
<html>
<head>
<title>API Request failed</title>
</head>
<body>
<h1>API Request failed</h1>

To Access this server from your IP range, we'll need to whitelist your IP address.
Contact us for further details: <a href="mailto:office@<?php echo $_SERVER["SERVER_ADDR"]; ?>">support</a>

</body>
</html>
