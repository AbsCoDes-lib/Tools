

Function Test-Pipe  {

    [CmdletBinding()]
    Param(
        [parameter(ValueFromPipeline=$True, ValueFromPipelineByPropertyName=$True)]
        [alias ("Parameter")]
        [String[]]$Parameters
    )

    $lines = (($input | FT * -A | Out-String) -replace "`r", "" -split "`n") | ? {$_.Trim() -ne ""};
    If(!($lines)) {
        $lines = (($Parameters | FT * -A | Out-String) -replace "`r", "" -split "`n") | ? {$_.Trim() -ne ""};
    }


    Foreach($line in $lines) {
        $line
    }
}
cls

Test-Pipe "Val1","Val2" -Verbose

"Val3","Val4" | Test-Pipe -Verbose
