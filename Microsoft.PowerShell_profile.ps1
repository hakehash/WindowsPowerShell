function cd(){
  Param($PATH=$HOME)
  if ($PATH -eq '-') {
    $TEMPPWD = Get-Location
    Set-Location $OLDPWD
    $global:OLDPWD = $TEMPPWD
    (Get-Location).Path
  } else {
    $global:OLDPWD = Get-Location
    Set-Location $PATH
  }
}
function touch() {
  Param($FILE)
  if (Test-Path $FILE) {
    (Get-Item $FILE).LastWriteTime = Get-Date
  } else {
    Out-File -Encoding ASCII -FilePath $FILE -NoClobber
  }
}
function iexplore() {
  (New-Object -ComObject InternetExplorer.Application).Visible = $True
}
function ls(){
  Param($PATH)
  Get-ChildItem $PATH -Name
}
function pwd(){
  (Get-Location).Path
}
Remove-Item Alias:cd -ErrorAction SilentlyContinue
Remove-Item Alias:curl -ErrorAction SilentlyContinue
Remove-Item Alias:ls -ErrorAction SilentlyContinue
Remove-Item Alias:pwd -ErrorAction SilentlyContinue
Set-Alias vi vim
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Chord Ctrl+y -Function Paste
