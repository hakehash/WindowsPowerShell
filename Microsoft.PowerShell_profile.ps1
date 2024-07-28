function cd() {
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
function tac() {
  Param($FILE)
  (Get-Content $FILE)[(Get-Content $FILE).length..0]
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
function photoviewer() {
  Param($FILE)
  rundll32 "C:\Program Files\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen (Get-Item $FILE).FullName
}
function pwd() {
  (Get-Location).Path
}
Remove-Item Alias:cd -ErrorAction SilentlyContinue
Remove-Item Alias:curl -ErrorAction SilentlyContinue
Remove-Item Alias:ls -ErrorAction SilentlyContinue
Remove-Item Alias:pwd -ErrorAction SilentlyContinue
Set-Alias dirname Split-Path
Set-Alias grep Select-String
Set-Alias uniq Get-Unique
Set-Alias vi vim
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Chord Ctrl+y -Function Paste
$OutputEncoding = [Console]::OutputEncoding
