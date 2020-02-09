#Vanlig function med Clear-Host och Write host som skriver ut loggan och frågorna med indikator 1: , 2: osv.
function Show-Menu {
    param (
        [string]$Title = 'Sok Menu'
    )
    Clear-Host
    Write-Host "======================== $Title =========================" -ForegroundColor Yellow
    Write-Host "-----------------------------------------------------------"-ForegroundColor Yellow
    Write-Host "███████╗ ██████╗ ██╗  ██╗████████╗███████╗██╗  ██╗████████╗"-ForegroundColor Yellow
    Write-Host "██╔════╝██╔═══██╗██║ ██╔╝╚══██╔══╝██╔════╝╚██╗██╔╝╚══██╔══╝"-ForegroundColor Yellow
    Write-Host "███████╗██║   ██║█████╔╝    ██║   █████╗   ╚███╔╝    ██║   "-ForegroundColor Yellow
    Write-Host "╚════██║██║   ██║██╔═██╗    ██║   ██╔══╝   ██╔██╗    ██║   "-ForegroundColor Yellow
    Write-Host "███████║╚██████╔╝██║  ██╗   ██║   ███████╗██╔╝ ██╗   ██║   "-ForegroundColor Yellow
    Write-Host "╚══════╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝   "-ForegroundColor Yellow
    Write-Host "-----------------------------------------------------------"-ForegroundColor Yellow
    Write-Host "==========================================================="-ForegroundColor Yellow
    Write-Host "==========================================================="-ForegroundColor Yellow
    
    Write-Host "START WITH 1: Set the PATH to current directory with option 1" -ForegroundColor Red
    Write-Host "1: Press '1' -Set the current directory as a PATH where the script is being running from." -ForegroundColor Yellow
    Write-Host "2: Press '2' -List all the files in this directory (+ Sub Directories)." -ForegroundColor Yellow
    Write-Host "3: Press '3' -Search the password you  want to find. " -ForegroundColor Yellow
    Write-Host "4: Press '4' -Save all password in Password.txt file in this directory " -ForegroundColor Yellow
    Write-Host "Q: Press 'Q' -Quit." -ForegroundColor Yellow
}

do
 {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    { '1' {
    Set-Location -Path $PSScriptRoot #Vi sätter PATH-en där vi har skripten
    } '2' {
    Get-ChildItem -Path $PSScriptRoot | Sort-Object -Property Length
    } '3' {
    $pwd_string = Read-Host 'Enter a Password you want to search' #Vanlig input så att användaren kan mata in vad de vill söka
      Select-String -Path "*.txt" -Pattern $pwd_string | Sort-Object -Descending | Format-List
    } '4' {
      #loop with variables
      Select-String -Path "*.txt" -Pattern $pwd_string | Sort-Object -Descending |Format-List | Out-File -FilePath ".\${env:computername}_Passwords.txt" -NoClobber
    }
    }
    pause
 }
 until ($selection -eq 'q')

