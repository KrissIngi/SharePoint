# About

If a ScriptLink is broken on a SharePoint site, then the SharePoint rendering engine will most often stop rendering and only display a blank site. This can happen after a new ScriptLink is added to the site collection, and that link is pointing to an address that is incorrect or contains errors.

This script can then be used to list all the ScriptLinks/CustomUserActions on the Site Collection, and then the user can look through the site links to try to find the one that is breaking the site.

If the rendering engine stops then the page will only contain this:

```html
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
```


# How to use
Simply run the script from PowerShell or Command Prompt, the script will ask you to log in and to enter the site collection affected.
The script will then run through all the CustomActions on the site collection and then display them. After that, the script will ask
for an ID of the ScriptLink to remove and then remove that link.
