
. ..\function\tool\Out-HasteBin.ps1

cls

# Paramètrage du proxy
$webclient = New-Object System.Net.WebClient
$webclient.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials



"Hello World" | Out-HasteBin

"Hello World","from here" | Out-HasteBin

Out-HasteBin "Hello World"

Out-HasteBin "Hello World","from here"