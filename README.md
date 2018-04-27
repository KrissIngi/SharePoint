# About

This script can be used when a Site Collection only returns a blank page after changing script links or if a script link is corrupt.

If a Site Collection only returns with a page that contains only this:
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><meta name="Robots" content="NOINDEX ">
</head>

<body>
                <script type="text/javascript">
                 var gearPage = document.getElementById('GearPage');
                 if(null != gearPage)
                 {
                     gearPage.parentNode.removeChild(gearPage);
                     document.title = "Error";
                 }
                 </script>
</body>
</html>

Then this PowerShell script can be used to list all the script links in a site collection that is affected.

# How to use
Simply run the script from PowerShell or Command Prompt, the script will ask you to log in and to enter the site collection affected.
The script will then run through all the CustomActions on the site collection and then display them. After that, the script will ask
for an ID of the ScriptLink to remove and then remove that link.
