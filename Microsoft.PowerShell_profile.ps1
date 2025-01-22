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
function iexplore() {
  (New-Object -ComObject InternetExplorer.Application).Visible = $True
}
function ls(){
  Param($PATH)
  Get-ChildItem $PATH -Name
}
function mkdir(){
  New-Item -ItemType "directory" -Path $Args
}
function photoviewer() {
  Param($FILE)
  rundll32 "C:\Program Files\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen (Get-Item $FILE).FullName
}
function pwd() {
  (Get-Location).Path
}
function tac() {
  Param($FILE)
  (Get-Content $FILE)[(Get-Content $FILE).length..0]
}
function tail(){
  Param($FILE, [int]$n = 10)
  Get-Content $FILE -Tail $n
}
function touch() {
  Param($FILE)
  if (Test-Path $FILE) {
    (Get-Item $FILE).LastWriteTime = Get-Date
  } else {
    Out-File -Encoding ASCII -FilePath $FILE -NoClobber
  }
}
function type(){
  Param($COMMAND)
  (Get-Command $COMMAND).Source
}
Add-Type -AssemblyName "Microsoft.VisualBasic"
Remove-Item Alias:cd -ErrorAction SilentlyContinue
Remove-Item Alias:curl -ErrorAction SilentlyContinue
Remove-Item Alias:ls -ErrorAction SilentlyContinue
Remove-Item Alias:pwd -ErrorAction SilentlyContinue
Remove-Item Alias:type -ErrorAction SilentlyContinue
Remove-Item Alias:where -Force -ErrorAction SilentlyContinue
Set-Alias dirname Split-Path
Set-Alias grep Select-String
Set-Alias uniq Get-Unique
Set-Alias vi vim
Set-Alias which type
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Chord Ctrl+y -Function Paste
$OutputEncoding = [Console]::OutputEncoding
