# Get the user, or replace with manual
$USER = $env:USERNAME

ren C:\Users\$USER\AppData\Local\nvim nvim-backup
git clone https://github.com/NvChad/NvChad C:\Users\$USER\AppData\Local\nvim --depth 1

nvim

ren C:\Users\$USER\AppData\Local\nvim\lua\custom custom-backup
git clone https://github.com/Alwaa/nvchad-custom.git C:\Users\$USER\AppData\Local\nvim\lua\custom

# Does not work properly # choco install nerdfont-hack

Write-Output "NB! Setup NerdFont Manually"
Write-Output "NB! Setup NerdFont Manually"
Write-Output "NB! Setup NerdFont Manually"

# Delete:
# C:\Users\$USER\AppData\Local\Microsoft\WindowsApps

## https://www.reddit.com/r/neovim/comments/100srii/running_neovim_with_mason_on_my_windows_machine/

Write-Output "!!Detete (maybe) C:\Users\$USER\AppData\Local\Microsoft\WindowsApps from PATH to avoid python cmd problems!!"
