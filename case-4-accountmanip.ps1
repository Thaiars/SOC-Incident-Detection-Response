# Case 4: Account Manipulation Simulation
Write-Host "Case 4: Account Manipulation" -ForegroundColor Cyan

$targetUser = "target_u"

Write-Host "[*] Setup: Creating target account '$targetUser'..." -ForegroundColor Yellow
$initPass = ConvertTo-SecureString "InitPass123!" -AsPlainText -Force
try {
    New-LocalUser -Name $targetUser `
                  -Password $initPass `
                  -PasswordNeverExpires `
                  -ErrorAction Stop | Out-Null
    Write-Host "[+] Target account created: $targetUser" -ForegroundColor Green
} catch {
    Write-Host "[!] Account may already exist, continuing..." -ForegroundColor Yellow
}

Start-Sleep -Seconds 2
Write-Host "[*] Step 1: Attempting password change (4723)..." -ForegroundColor Yellow
try {
    $user = [adsi]"WinNT://./$targetUser,user"
    $user.ChangePassword("WrongOldPass!", "NewPass456!")
} catch {
}
Write-Host "[+] Event 4723 generated - Password change attempted on $targetUser" -ForegroundColor Green

Start-Sleep -Seconds 2

Write-Host "[*] Step 2: Admin force-resetting password (4724)..." -ForegroundColor Yellow

try {
    $newPass = ConvertTo-SecureString "ForcedPass789!" -AsPlainText -Force
    Set-LocalUser -Name $targetUser -Password $newPass -ErrorAction Stop
    Write-Host "[+] Event 4724 generated - Password force-reset on $targetUser" -ForegroundColor Green
} catch {
    Write-Host "[!] Error: $_" -ForegroundColor Red
}

Start-Sleep -Seconds 2

Write-Host "[*] Step 3: Disabling account (4725)..." -ForegroundColor Yellow

try {
    Disable-LocalUser -Name $targetUser -ErrorAction Stop
    Write-Host "[+] Event 4725 generated - Account disabled: $targetUser" -ForegroundColor Green
} catch {
    Write-Host "[!] Error: $_" -ForegroundColor Red
}

Start-Sleep -Seconds 2

Write-Host "[*] Step 4: Deleting account (4726)..." -ForegroundColor Yellow

try {
    Remove-LocalUser -Name $targetUser -ErrorAction Stop
    Write-Host "[+] Event 4726 generated - Account deleted: $targetUser" -ForegroundColor Green
} catch {
    Write-Host "[!] Error: $_" -ForegroundColor Red
}

Write-Host " Case 4 Complete" -ForegroundColor Cyan
Write-Host " Events generated: 4723, 4724, 4725, 4726" -ForegroundColor Cyan
