#Requires -version 3

function Run-JavaJar {

    param
    (
        # Chemin contenant le fichier jar
        [Parameter(Position=0, Mandatory=$True)]
        [ValidateScript({Test-Path -Path $_ -PathType 'Container' -IsValid})]
        [string]$Path,
        
        # Jar à executer
        [Parameter(Position=1, Mandatory=$True)]
        [ValidateScript({Test-Path -Path $Path+'\'+$_ -PathType 'Leaf' -IsValid})]
        [string]$JarFile,

        # Xms
        [string]$Xms = '128m',

        # Xmx
        [string]$Xmx = '512m',

        # Argumemts de la JVM
        [string]$JvmArgs = [string]::Empty,

        # Paramètres du proxy
        [string]$HttpHost = '',
        [string]$HttpPort = '',
        [string]$HttpsHost = '',
        [string]$HttpsPort = '',
        [string]$NonProxyHosts = '',

        # Reprise des switchs de la fontion Start-Process
        [bool]$NoNewWindow = $True,
        [bool]$Wait = $True,
        [string]$Title =''
    )

    begin {
        [string]$ArgumentList = [String]::Empty
        [string]$CommandLine = [String]::Empty
    }

    process {
        $ArgumentList += '-server' + ' ';
        $ArgumentList += if($Xms.Length) { '-Xms' + $Xms + ' '} else {''};
        $ArgumentList += if($Xmx.Length) { '-Xmx' + $Xmx + ' '} else {''};
        $ArgumentList += if($JvmArgs.Length) { $JvmArgs + ' '} else {''};
        $ArgumentList += if($HttpHost.Length) { '-Dhttp.proxyHost=' + $HttpHost + ' '} else {''};
        $ArgumentList += if($HttpPort.Length) { '-Dhttp.proxyPort=' + $HttpPort + ' '} else {''};
        $ArgumentList += if($HttpsHost.Length) { '-Dhttps.proxyHost=' + $HttpsHost + ' '} else {''};
        $ArgumentList += if($HttpsPort.Length) { '-Dhttps.proxyPort=' + $HttpsPort + ' '} else {''};
        $ArgumentList += if($NonProxyHosts.Length) { '-Dhttp.nonProxyHosts="' + $NonProxyHosts + '" '} else {''};


        if($NoNewWindow -eq $True) {
            # Excecute java dans la console courante
            Start-Process  java -ArgumentList "$ArgumentList -jar $JarFile" -WorkingDirectory $Path -Wait:$Wait -NoNewWindow
        }
        else {
            # Lance java dans une fenêtre cmd
            $command = "java $ArgumentList -jar $JarFile";
            Start-Process "cmd" -argument "/C $command " -WorkingDirectory $Path -Wait:$Wait
        }
    }

    end {
    }
}