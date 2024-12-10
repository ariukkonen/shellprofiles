Import-Module -Name PowerColorLS
Import-Module posh-git
Import-Module -Name Terminal-Icons
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
set-psreadlineoption -PredictionViewStyle ListView

Set-TerminalIconsTheme -colortheme devblackops_light

#oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config "~/peru-shell.omp.json" | Invoke-Expression

function mdshow
{
Param([Parameter(Mandatory=$true)] [String]$Path)
Show-Markdown -Path $Path | more /E /C
}

function la
{
Param([Parameter(Mandatory=$false)] [String]$Path)
Get-ChildItem -Force $Path
}

function ll
{
Param([Parameter(Mandatory=$false)] [String]$Path)
if (!$Path)
{
PowerColorLS -l
}
else
{
PowerColorLS -l $Path
}

}

function lla
{
Param([Parameter(Mandatory=$false)] [String]$Path)
if (!$Path)
{
PowerColorLS -l -a
}
else
{
PowerColorLS -l -a $Path
}

}
if (Test-Path alias:dir*)
{
Remove-Item Alias:dir
Set-Alias -Name dir -Value PowerColorLS -Option AllScope
}

Function Set-FileTime{
  param(
    [string[]]$paths,
    [bool]$only_modification = $false,
    [bool]$only_access = $false
  )

  begin {
    function updateFileSystemInfo([System.IO.FileSystemInfo]$fsInfo) {
      $datetime = get-date
      if ( $only_access )
      {
         $fsInfo.LastAccessTime = $datetime
      }
      elseif ( $only_modification )
      {
         $fsInfo.LastWriteTime = $datetime
      }
      else
      {
         $fsInfo.CreationTime = $datetime
         $fsInfo.LastWriteTime = $datetime
         $fsInfo.LastAccessTime = $datetime
       }
    }
   
    function touchExistingFile($arg) {
      if ($arg -is [System.IO.FileSystemInfo]) {
        updateFileSystemInfo($arg)
      }
      else {
        $resolvedPaths = resolve-path $arg
        foreach ($rpath in $resolvedPaths) {
          if (test-path -type Container $rpath) {
            $fsInfo = new-object System.IO.DirectoryInfo($rpath)
          }
          else {
            $fsInfo = new-object System.IO.FileInfo($rpath)
          }
          updateFileSystemInfo($fsInfo)
        }
      }
    }
   
    function touchNewFile([string]$path) {
      #$null > $path
      Set-Content -Path $path -value $null;
    }
  }
 
  process {
    if ($_) {
      if (test-path $_) {
        touchExistingFile($_)
      }
      else {
        touchNewFile($_)
      }
    }
  }
 
  end {
    if ($paths) {
      foreach ($path in $paths) {
        if (test-path $path) {
          touchExistingFile($path)
        }
        else {
          touchNewFile($path)
        }
      }
    }
  }
}

Set-Alias touch Set-FileTime

Set-Alias -Name nano -Value c:\progra~1\git\usr\bin\nano.exe
Set-Alias -Name npp -Value "C:\Program Files\Notepad++\notepad++.exe"
