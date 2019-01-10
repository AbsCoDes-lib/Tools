
. ..\function\tool\Write-PSObject.ps1

#region XML Data Sample 
$xml = [XML] "<Servers><Server SN='01' Server='SPWFE01' IP='192.168.0.10' Manufacture='HP' MemoryMB='32768' FreeMemoryMB= '10240' CPUCores='8' HyperThreading='False' Virtualization='Disabled' HyperVSupport='True' /><Server SN='02' Server='SPWFE02' IP='192.168.1.3' Manufacture='Dell' MemoryMB='32768' FreeMemoryMB= '30720' CPUCores='8' HyperThreading='True' Virtualization='Disabled' HyperVSupport='True' /><Server SN='03' Server='SPWFE03' IP='192.168.0.22' Manufacture='HP' MemoryMB='32768' FreeMemoryMB= '510' CPUCores='8' HyperThreading='True' Virtualization='Disabled' HyperVSupport='False' /><Server SN='04' Server='SQLPR01' IP='192.168.1.5' Manufacture='HP' MemoryMB='65536' FreeMemoryMB= '5120' CPUCores='16' HyperThreading='True' Virtualization='Enabled' HyperVSupport='True' /><Server SN='05' Server='SQLMI01' IP='192.168.1.6' Manufacture='Dell' MemoryMB='65536' FreeMemoryMB= '6420' CPUCores='16' HyperThreading='False' Virtualization='Enabled' HyperVSupport='True' /></Servers>";
$servers = [PSObject[]] $xml.Servers.Server  | Select SN, Server, IP, Manufacture, MemoryMB, FreeMemoryMB, CPUCores, HyperThreading, Virtualization, HyperVSupport;
#endregion XML Data Sample

# Display the input object as it is without any formatting (Would act exactly as Write-Output).
Write-PSObject $servers;
# ----- Or ----- 
$servers | Write-PSObject;

write-host; write-host; write-host

# Display the body rows/lines (values) only.
Write-PSObject $servers -BodyOnly; 
# ----- Or ----- 
$servers | Write-PSObject -BodyOnly; 

write-host; write-host; write-host

# Display the Headers only
Write-PSObject $servers -HeadersOnly;

write-host; write-host; write-host

# Display the Headers only and remove the header separator line (display only row/line which displays the columns/properties name).
Write-PSObject $servers -HeadersOnly -RemoveHeadersSeparator;

write-host; write-host; write-host

# Display the Headers with White forecolor, and, Blue background color. And the body rows/lines (values) with Yellow forecolor, and, DarkRed background color.
Write-PSObject $servers -BodyForeColor Yellow -BodyBackColor DarkRed -HeadersForeColor White -HeadersBackColor Blue;

write-host; write-host; write-host

# Display the input object as formatted table which displays each row/line in odd sequence (starting with the first body row) with "Cyan" forecolor.
# Also, display each row/line in even sequence (starting with the second body row) with "Yellow" Fore Color.
Write-PSObject $servers -FormatTableColor -OddRowForeColor Cyan -EvenRowForeColor Yellow;

write-host; write-host; write-host

# Display the input object as formatted table which displays each row/line in odd sequence (starting with the first body row) with "DarkRed" background color.
# Also, display each row/line in even sequence (starting with the second body row) with "Blue" background color.
Write-PSObject $servers -FormatTableColor -OddRowBackColor DarkRed -EvenRowBackColor Blue;

write-host; write-host; write-host

# Display the input object as formatted table which displays each row/line in odd sequence (starting with the first body row) with "Black" forecolor and White background color..
# Also, display each row/line in even sequence (starting with the second body row) with "Yellow" Fore Color and Blue background color.
Write-PSObject $servers -FormatTableColor -OddRowForeColor Black -OddRowBackColor White -EvenRowForeColor Yellow -EvenRowBackColor Blue;

write-host; write-host; write-host

# Display the table with new linefeed between values/body rows/lines.
Write-PSObject $servers -InjectRowsSeparator;

write-host; write-host; write-host

# Display the table with new line of underscore characters ("_") between the values/body rows/lines.
Write-PSObject $servers -InjectRowsSeparator -RowsSeparator "_";
