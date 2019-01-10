function Out-HasteBin
{
    <#
        .SYNOPSIS
        Supports sending content to Hastebin.com
        .PARAMETER Content
        The content to be sent to hastebin.com
        .PARAMETER ServiceUrl
        The URL of your hastebin server. This will default to http://hastebin.com
        .OUTPUTS 
        System.String. Returns the URL of the hastebin resource.
        .EXAMPLE
        C:\PS>get-content | Out-HasteBin
        .EXAMPLE
        C:\PS>"Hello World" | Out-HasteBin
        .EXAMPLE
        C:\PS>Out-HasteBin "Hello World"
    #>

    param(
        [Parameter(Mandatory=$True, ValueFromPipeline = $true)]
        [string[]]$pipeInput,

        [string] $serviceUrl = "https://hastebin.com/"
    )

	begin {
		[array]$text=@()
    }
    
    process {
		$text += $pipeInput
	}

    end {
        # Create string from input
		$content = [system.String]::Join([Environment]::NewLine, $text)

        # Create paste
        $response = Invoke-RestMethod ($serviceUrl + "documents") -Method Post -Body $content
        return ($serviceUrl + $response.key)
    }
}