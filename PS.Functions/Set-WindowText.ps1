#Requires -version 3


# Add [Win32]::SetWindowText function
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public static class Win32 {
  [DllImport("User32.dll", EntryPoint="SetWindowText")]
  public static extern int SetWindowText(IntPtr hWnd, string strTitle);
}
"@

function Set-WindowText {

    param
    (
        [Parameter(Position=0, Mandatory=$True)]
        [System.IntPtr]$Handle,
        
        [Parameter(Position=1, Mandatory=$True)]
        [string]$Title
    )

    begin {
    }

    process {
        [Win32]::SetWindowText($Handle, $Title)
    }

    end {
    }
}