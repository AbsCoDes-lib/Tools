#Requires -RunAsAdministrator


# Define known folder GUIDs
# https://docs.microsoft.com/fr-fr/windows/desktop/shell/knownfolderid
$KnownFolders = @{
    'AccountPictures' = '008ca0b1-55b4-4c56-b8a8-4de4b299d3be';
    'AddNewPrograms' = 'de61d971-5ebc-4f02-a3a9-6c82895e5c04';
    'AdminTools' = '724EF170-A42D-4FEF-9F26-B60E846FBA4F';
    'AppDataDesktop' = 'B2C5E279-7ADD-439F-B28C-C41FE1BBF672';
    'AppDataDocuments' = '7BE16610-1F7F-44AC-BFF0-83E15F2FFCA1';
    'AppDataFavorites' = '7CFBEFBC-DE1F-45AA-B843-A542AC536CC9';
    'AppDataProgramData' = '559D40A3-A036-40FA-AF61-84CB430A4D34';
    'ApplicationShortcuts' = 'A3918781-E5F2-4890-B3D9-A7E54332328C';
    'AppsFolder' = '1e87508d-89c2-42f0-8a7e-645a0f50ca58';
    'AppUpdates' = 'a305ce99-f527-492b-8b1a-7e76fa98d6e4';
    'CameraRoll' = 'AB5FB87B-7CE2-4F83-915D-550846C9537B';
    'CDBurning' = '9E52AB10-F80D-49DF-ACB8-4330F5687855';
    'ChangeRemovePrograms' = 'df7266ac-9274-4867-8d55-3bd661de872d';
    'CommonAdminTools' = 'D0384E7D-BAC3-4797-8F14-CBA229B392B5';
    'CommonOEMLinks' = 'C1BAE2D0-10DF-4334-BEDD-7AA20B227A9D';
    'CommonPrograms' = '0139D44E-6AFE-49F2-8690-3DAFCAE6FFB8';
    'CommonStartMenu' = 'A4115719-D62E-491D-AA7C-E74B8BE3B067';
    'CommonStartup' = '82A5EA35-D9CD-47C5-9629-E15D2F714E6E';
    'CommonTemplates' = 'B94237E7-57AC-4347-9151-B08C6C32D1F7';
    'ComputerFolder' = '0AC0837C-BBF8-452A-850D-79D08E667CA7';
    'ConflictFolder' = '4bfefb45-347d-4006-a5be-ac0cb0567192';
    'ConnectionsFolder' = '6F0CD92B-2E97-45D1-88FF-B0D186B8DEDD';
    'Contacts' = '56784854-C6CB-462b-8169-88E350ACB882';
    'ControlPanelFolder' = '82A74AEB-AEB4-465C-A014-D097EE346D63';
    'Cookies' = '2B0F765D-C0E9-4171-908E-08A611B84FF6';
    'Desktop' = 'B4BFCC3A-DB2C-424C-B029-7FE99A87C641';
    'DeviceMetadataStore' = '5CE4A5E9-E4EB-479D-B89F-130C02886155';
    'Documents' = @('FDD39AD0-238F-46AF-ADB4-6C85480369C7','f42ee2d3-909f-4907-8871-4c22fc0bf756');
    'DocumentsLibrary' = '7B0DB17D-9CD2-4A93-9733-46CC89022E7C';
    'Downloads' = @('374DE290-123F-4565-9164-39C4925E467B','7d83ee9b-2244-4e70-b1f5-5393042af1e4');
    'Favorites' = '1777F761-68AD-4D8A-87BD-30B759FA33DD';
    'Fonts' = 'FD228CB7-AE11-4AE3-864C-16F3910AB8FE';
    'Games' = 'CAC52C1A-B53D-4edc-92D7-6B2E8AC19434';
    'GameTasks' = '054FAE61-4DD8-4787-80B6-090220C4B700';
    'History' = 'D9DC8A3B-B784-432E-A781-5A1130A75963';
    'HomeGroup' = '52528A6B-B9E3-4ADD-B60D-588C2DBA842D';
    'HomeGroupCurrentUser' = '9B74B6A3-0DFD-4f11-9E78-5F7800F2E772';
    'ImplicitAppShortcuts' = 'BCB5256F-79F6-4CEE-B725-DC34E402FD46';
    'InternetCache' = '352481E8-33BE-4251-BA85-6007CAEDCF9D';
    'InternetFolder' = '4D9F7874-4E0C-4904-967B-40B0D20C3E4B';
    'Libraries' = '1B3EA5DC-B587-4786-B4EF-BD1DC332AEAE';
    'Links' = 'bfb9d5e0-c6a9-404c-b2b2-ae6db6af4968';
    'LocalAppData' = 'F1B32785-6FBA-4FCF-9D55-7B8E7F157091';
    'LocalAppDataLow' = 'A520A1A4-1780-4FF6-BD18-167343C5AF16';
    'LocalizedResourcesDir' = '2A00375E-224C-49DE-B8D1-440DF7EF3DDC';
    'Music' = @('4BD8D571-6D19-48D3-BE97-422220080E43','a0c69a99-21c8-4671-8703-7934162fcf1d');
    'MusicLibrary' = '2112AB0A-C86A-4FFE-A368-0DE96E47012E';
    'NetHood' = 'C5ABBF53-E17F-4121-8900-86626FC2C973';
    'NetworkFolder' = 'D20BEEC4-5CA8-4905-AE3B-BF251EA09B53';
    'Objects3D' = '31C0DD25-9439-4F12-BF41-7FF4EDA38722';
    'OriginalImages' = '2C36C0AA-5812-4b87-BFD0-4CD0DFB19B39';
    'PhotoAlbums' = '69D2CF90-FC33-4FB7-9A0C-EBB0F0FCB43C';
    'PicturesLibrary' = 'A990AE9F-A03B-4E80-94BC-9912D7504104';
    'Pictures' = @('33E28130-4E1E-4676-835A-98395C3BC3BB','0ddd015d-b06c-45d5-8c4c-f59713854639');
    'Playlists' = 'DE92C1C7-837F-4F69-A3BB-86E631204A23';
    'PrintersFolder' = '76FC4E2D-D6AD-4519-A663-37BD56068185';
    'PrintHood' = '9274BD8D-CFD1-41C3-B35E-B13F55A758F4';
    'Profile' = '5E6C858F-0E22-4760-9AFE-EA3317B67173';
    'ProgramData' = '62AB5D82-FDC1-4DC3-A9DD-070D1D495D97';
    'ProgramFiles' = '905e63b6-c1bf-494e-b29c-65b732d3d21a';
    'ProgramFilesX64' = '6D809377-6AF0-444b-8957-A3773F02200E';
    'ProgramFilesX86' = '7C5A40EF-A0FB-4BFC-874A-C0F2E0B9FA8E';
    'ProgramFilesCommon' = 'F7F1ED05-9F6D-47A2-AAAE-29D317C6F066';
    'ProgramFilesCommonX64' = '6365D5A7-0F0D-45E5-87F6-0DA56B6A4F7D';
    'ProgramFilesCommonX86' = 'DE974D24-D9C6-4D3E-BF91-F4455120B917';
    'Programs' = 'A77F5D77-2E2B-44C3-A6A2-ABA601054A51';
    'Public' = 'DFDF76A2-C82A-4D63-906A-5644AC457385';
    'PublicDesktop' = 'C4AA340D-F20F-4863-AFEF-F87EF2E6BA25';
    'PublicDocuments' = 'ED4824AF-DCE4-45A8-81E2-FC7965083634';
    'PublicDownloads' = '3D644C9B-1FB8-4f30-9B45-F670235F79C0';
    'PublicGameTasks' = 'DEBF2536-E1A8-4c59-B6A2-414586476AEA';
    'PublicLibraries' = '48DAF80B-E6CF-4F4E-B800-0E69D84EE384';
    'PublicMusic' = '3214FAB5-9757-4298-BB61-92A9DEAA44FF';
    'PublicPictures' = 'B6EBFB86-6907-413C-9AF7-4FC2ABF07CC5';
    'PublicRingtones' = 'E555AB60-153B-4D17-9F04-A5FE99FC15EC';
    'PublicUserTiles' = '0482af6c-08f1-4c34-8c90-e17ec98b1e17';
    'PublicVideos' = '2400183A-6185-49FB-A2D8-4A392A602BA3';
    'QuickLaunch' = '52a4f021-7b75-48a9-9f6b-4b87a210bc8f';
    'Recent' = 'AE50C081-EBD2-438A-8655-8A092E34987A';
    'RecordedTVLibrary' = '1A6FDBA2-F42D-4358-A798-B74D745926C5';
    'RecycleBinFolder' = 'B7534046-3ECB-4C18-BE4E-64CD4CB7D6AC';
    'ResourceDir' = '8AD10C31-2ADB-4296-A8F7-E4701232C972';
    'Ringtones' = 'C870044B-F49E-4126-A9C3-B52A1FF411E8';
    'RoamingAppData' = '3EB685DB-65F9-4CF6-A03A-E3EF65729F3D';
    'RoamedTileImages' = 'AAA8D5A5-F1D6-4259-BAA8-78E7EF60835E';
    'RoamingTiles' = '00BCFC5A-ED94-4e48-96A1-3F6217F21990';
    'SampleMusic' = 'B250C668-F57D-4EE1-A63C-290EE7D1AA1F';
    'SamplePictures' = 'C4900540-2379-4C75-844B-64E6FAF8716B';
    'SamplePlaylists' = '15CA69B3-30EE-49C1-ACE1-6B5EC372AFB5';
    'SampleVideos' = '859EAD94-2E85-48AD-A71A-0969CB56A6CD';
    'SavedGames' = '4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4';
    'SavedPictures' = '3B193882-D3AD-4eab-965A-69829D1FB59F';
    'SavedPicturesLibrary' = 'E25B5812-BE88-4bd9-94B0-29233477B6C3';
    'SavedSearches' = '7d1d3a04-debb-4115-95cf-2f29da2920da';
    'Screenshots' = 'b7bede81-df94-4682-a7d8-57a52620b86f';
    'SEARCH_CSC' = 'ee32e446-31ca-4aba-814f-a5ebd2fd6d5e';
    'SearchHistory' = '0D4C3DB6-03A3-462F-A0E6-08924C41B5D4';
    'SearchHome' = '190337d1-b8ca-4121-a639-6d472d16972a';
    'SEARCH_MAPI' = '98ec0e18-2098-4d44-8644-66979315a281';
    'SearchTemplates' = '7E636BFE-DFA9-4D5E-B456-D7B39851D8A9';
    'SendTo' = '8983036C-27C0-404B-8F08-102D10DCFD74';
    'SidebarDefaultParts' = '7B396E54-9EC5-4300-BE0A-2482EBAE1A26';
    'SidebarParts' = 'A75D362E-50FC-4fb7-AC2C-A8BEAA314493';
    'SkyDrive' = 'A52BBA46-E9E1-435f-B3D9-28DAA648C0F6';
    'SkyDriveCameraRoll' = '767E6811-49CB-4273-87C2-20F355E1085B';
    'SkyDriveDocuments' = '24D89E24-2F19-4534-9DDE-6A6671FBB8FE';
    'SkyDrivePictures' = '339719B5-8C47-4894-94C2-D8F77ADD44A6';
    'StartMenu' = '625B53C3-AB48-4EC1-BA1F-A1EF4146FC19';
    'Startup' = 'B97D20BB-F46A-4C97-BA10-5E3608430854';
    'SyncManagerFolder' = '43668BF8-C14E-49B2-97C9-747784D784B7';
    'SyncResultsFolder' = '289a9a43-be44-4057-a41b-587a76d7e7f9';
    'SyncSetupFolder' = '0F214138-B1D3-4a90-BBA9-27CBC0C5389A';
    'System' = '1AC14E77-02E7-4E5D-B744-2EB1AE5198B7';
    'SystemX86' = 'D65231B0-B2F1-4857-A4CE-A8E7C6EA7D27';
    'Templates' = 'A63293E8-664E-48DB-A079-DF759E0509F7';
    'TreeProperties' = '5b3749ad-b49f-49c1-83eb-15370fbd4882';
    'UserPinned' = '9E3995AB-1F9C-4F13-B827-48B24B6C7174';
    'UserProfiles' = '0762D272-C50A-4BB0-A382-697DCD729B80';
    'UserProgramFiles' = '5CD7AEE2-2219-4A67-B85D-6C9CE15660CB';
    'UserProgramFilesCommon' = 'BCBD3057-CA5C-4622-B42D-BC56DB0AE516';
    'UsersFiles' = 'f3ce0f7c-4901-4acc-8648-d5d44b04ef8f';
    'UsersLibraries' = 'A302545D-DEFF-464b-ABE8-61C8648D939B';
    'Videos' = @('18989B1D-99B5-455B-841C-AB7C74E4DDFC','35286a68-3c57-41a1-bbb1-0eae73d76c95');
    'VideosLibrary' = '491E922F-5643-4AF4-A7EB-4E7A138D8174';
    'Windows' = 'F38BF404-1D43-42F2-9305-67DE0B28FC23';
}


# Add Shell32 class to the session
$Shell32 = ([System.Management.Automation.PSTypeName]'Shell32').Type
If (-not $Shell32) {
    $Signature = @'
    using System;
    using System.Runtime.InteropServices;

    public class Shell32
    {
        [DllImport("shell32.dll")]
        public static extern int SHSetKnownFolderPath(ref Guid folderId, uint flags, IntPtr token, [MarshalAs(UnmanagedType.LPWStr)] string path);

        [DllImport("shell32.dll")]
        private static extern int SHGetKnownFolderPath(ref Guid folderId, uint flags, IntPtr token, out IntPtr pszPath);

        public static int SetKnownFolderPath(Guid folderId, string path) {
            return SHSetKnownFolderPath(ref folderId, 0, IntPtr.Zero, path);
        }

        public static string GetKnownFolderPath(Guid folderId) {
            IntPtr pszPath;
            if (SHGetKnownFolderPath(ref folderId, 0, IntPtr.Zero, out pszPath) != 0) {
                return "";
            }
            string path = Marshal.PtrToStringUni(pszPath);
            Marshal.FreeCoTaskMem(pszPath);
            return path;
        }
    }
'@
    $Shell32 = Add-Type -TypeDefinition $Signature -PassThru
}


<#
.SYNOPSIS
    Sets a known folder's path using SHSetKnownFolderPath.
.PARAMETER KnownFolder
    The known folder whose path to set.
.PARAMETER Path
    The target path to redirect the folder to.
.NOTES
    Forked from: https://gist.github.com/semenko/49a28675e4aae5c8be49b83960877ac5
#>
Function Set-KnownFolderPath {
    Param (
            [Parameter(Mandatory = $true)]
            [ValidateScript({
                if($KnownFolders.Contains($_)) {
                    $true
                } else {
                    Throw "$_ is not a valid known folder!"
                }})]
            [string]$KnownFolder,

            [Parameter(Mandatory = $true)]
            [string]$Path
    )

	# Make path, if doesn't exist
	If (!(Test-Path $Path -PathType Container)) {
		New-Item -Path $Path -Type Directory -Force
    }

    # Validate the path
    If (Test-Path $Path -PathType Container) {
        # Call SHSetKnownFolderPath
        ForEach ($guid in $KnownFolders[$KnownFolder]) {
            $result = $Shell32::SetKnownFolderPath($guid, $Path)
            If ($result -ne 0) {
                $errormsg = "Error redirecting $($KnownFolder). Return code $($result) = $((New-Object System.ComponentModel.Win32Exception($result)).message)"
                Throw $errormsg
            }
        }
    } Else {
        Throw New-Object System.IO.DirectoryNotFoundException "Could not find part of the path $Path."
    }

	# Fix up permissions, if we're still here
	Attrib +r $Path

    Return $Path
}


<#
.SYNOPSIS
    Gets a known folder's path using GetFolderPath.
.PARAMETER KnownFolder
    The known folder whose path to get.
.NOTES
    https://stackoverflow.com/questions/16658015/how-can-i-use-powershell-to-call-shgetknownfolderpath
#>
Function Get-KnownFolderPath {
    Param (
            [Parameter(Mandatory = $true)]
            [ValidateScript({
                if($KnownFolders.Contains($_)) {
                    $true
                } else {
                    Throw "$_ is not a valid known folder!"
                }})]
            [string]$KnownFolder
    )

    ForEach ($guid in $KnownFolders[$KnownFolder]) {
        $path = $Shell32::GetKnownFolderPath($guid)
        If (Test-Path $path -PathType Container) {
            return $path
        }
    }

    Throw New-Object System.IO.DirectoryNotFoundException "Could not find a known folder for $KnownFolder."
}


<#
.SYNOPSIS
    Gets OneDrive folder's path.
#>
Function Get-OneDriveFolderPath {
	Get-ItemPropertyValue -Path 'HKCU:\Software\Microsoft\OneDrive\Accounts\Business1' -Name 'UserFolder'
}


<#
.SYNOPSIS
    Moves contents of a folder with output to a log.
    Uses Robocopy to ensure data integrity and all moves are logged for auditing.
    Means we don't need to re-write functionality in PowerShell.
.PARAMETER Source
    The source folder.
.PARAMETER Destination
    The destination log.
.PARAMETER Log
    The log file to store progress/output
#>
Function Move-Files {
    Param (
            [Parameter(Mandatory = $true)]
            [string]$Source,

            [Parameter(Mandatory = $true)]
            [string]$Destination,

            [Parameter(Mandatory = $true)]
            [string]$Log
    )

    If (!(Test-Path (Split-Path $Log))) { New-Item -Path (Split-Path $Log) -ItemType Container }
    Robocopy.exe $Source $Destination /E /COPY:DATSO /MOVE /MT:4 /R:1 /W:1 /XJ /XJD /XJF /NP /LOG+:$Log
}


<#
.SYNOPSIS
    Function exists to reduce code required to redirect each folder.
#>
Function Move-ProfileFolder {
    Param (
        $SyncFolder,
        $GetFolder,
        $SetFolder,
        $Target
    )

    # Get current Known folder path
    $Folder = Get-KnownFolderPath -KnownFolder $GetFolder

    # If paths don't match, redirect the folder
    If ($null -ne $Folder -and $Folder -ne "$SyncFolder\$Target") {
        # Redirect the folder
        Set-KnownFolderPath -KnownFolder $SetFolder -Path "$SyncFolder\$Target"
        # Move files/folders into the redirected folder
        Move-Files -Source $Folder -Destination "$SyncFolder\$Target" -Log "$env:LocalAppData\RedirectLogs\Robocopy$Target.log"
        # Hide the source folder (rather than delete it)
        Attrib +h $Folder
    }
}

# Destination folder
$SyncFolder = "D:\Utilisateurs\$(split-path $env:USERPROFILE -leaf)"

# Root Folders
Move-ProfileFolder -GetFolder 'Desktop' -SetFolder 'Desktop' -Target 'Desktop' -SyncFolder $SyncFolder
Move-ProfileFolder -GetFolder 'Documents' -SetFolder 'Documents' -Target 'Documents' -SyncFolder $SyncFolder
Move-ProfileFolder -GetFolder 'Downloads' -SetFolder 'Downloads' -Target 'Downloads' -SyncFolder $SyncFolder
Move-ProfileFolder -GetFolder 'Pictures' -SetFolder 'Pictures' -Target 'Pictures' -SyncFolder $SyncFolder
Move-ProfileFolder -GetFolder 'Videos' -SetFolder 'Videos' -Target 'Videos' -SyncFolder $SyncFolder
Move-ProfileFolder -GetFolder 'Music' -SetFolder 'Music' -Target 'Music' -SyncFolder $SyncFolder

# # Annoying Other Folders
# Move-ProfileFolder -GetFolder 'Contacts' -SetFolder 'Contacts' -Target 'Contacts' -SyncFolder $SyncFolder
# Move-ProfileFolder -GetFolder 'Favorites' -SetFolder 'Favorites' -Target 'Favorites' -SyncFolder $SyncFolder
# Move-ProfileFolder -GetFolder 'Links' -SetFolder 'Links' -Target 'Links' -SyncFolder $SyncFolder
# Move-ProfileFolder -GetFolder 'Saved Games' -SetFolder 'Saved Games' -Target 'Saved Games' -SyncFolder $SyncFolder
# Move-ProfileFolder -GetFolder 'Searches' -SetFolder 'Searches' -Target 'Searches' -SyncFolder $SyncFolder
# Move-ProfileFolder -GetFolder 'Start Menu' -SetFolder 'Start Menu' -Target 'Start Menu' -SyncFolder $SyncFolder
