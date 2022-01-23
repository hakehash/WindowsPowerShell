function iexplore() {
  (New-Object -ComObject InternetExplorer.Application).Visible = $True
}
Remove-Item Alias:curl
Set-Alias vi vim
Set-PSReadLineOption -EditMode Emacs
