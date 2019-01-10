#Requires -version 3
#Requires -RunAsAdministrator

# Paramètrage du proxy
$webclient = New-Object System.Net.WebClient
$webclient.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

# Mise à jour de l'aide
Update-Help
