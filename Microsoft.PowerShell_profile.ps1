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
Remove-Item Alias:curl
Set-Alias vi vim
Set-PSReadLineOption -EditMode Emacs
