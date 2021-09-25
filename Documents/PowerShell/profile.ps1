#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
(& "$Env:USERPROFILE\miniconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
#endregion

Set-PoshPrompt -Theme powerlevel10k_modern
