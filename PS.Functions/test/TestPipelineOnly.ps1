

Function Test-PipeOnly  {

    [CmdletBinding()]
    Param(
        [parameter(ValueFromPipeline=$True, ValueFromPipelineByPropertyName=$True)]
        [alias ("Parameter")]
        [String[]]$Parameters
    )

    Begin {
        Write-Verbose "Enter begin block"
        $Parameters
    }

    Process {
        Write-Verbose "Enter process block"
        $_
    }

    End {
        Write-Verbose "Enter end block"

    }
}

cls

"Val3","Val4" | Test-PipeOnly -Verbose

# Attention l'appel suivant ne fonctionne pas
# car la fonction est dédiée aux pipe
#Test-PipeOnly "Val1","Val2" -Verbose
