
. ..\function\tool\Write-Color.ps1


Write-Color -Text "Red ", "Green ", "Yellow " -Color Red,Green,Yellow

Write-Color -Text "This is text in Green ",
                   "followed by red ",
                   "and then we have Magenta... ",
                   "isn't it fun? ",
                   "Here goes DarkCyan"  `
            -Color Green,Red,Magenta,White,DarkCyan `
            -StartTab 3 `
            -LinesBefore 1 `
            -LinesAfter 1

Write-Color -Text "This little ","message is ", "written to log ", "file as well." `
            -Color Yellow, White, Green, Red, Red `
            -LinesBefore 2 `
            -LogFile "$pwd\testing.txt" `
            -TimeFormat "yyyy-MM-dd HH:mm:ss"

Write-Color -Text "This can get ","handy if ", "want to display things, and log actions to file ", "at the same time." `
            -Color Yellow, White, Green, Red, Red `
            -LogFile "C:\testing.txt"