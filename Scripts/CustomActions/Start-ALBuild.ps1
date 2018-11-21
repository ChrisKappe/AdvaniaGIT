Write-Host Remove existing container
& (Join-path $PSScriptRoot 'Remove-NavEnvironment.ps1')
Write-Host Set unique branch id for build
& (Join-path $PSScriptRoot 'Create-NewBranchId.ps1')
Write-Host Build and Update Docker Container
& (Join-path $PSScriptRoot 'Build-NavEnvironment.ps1')
Write-Host Initialize Test Company
& (Join-path $PSScriptRoot 'Initialize-NAVCompany.ps1')
Write-Host Download AL Addin
& (Join-path $PSScriptRoot 'Download-ALAddin.ps1')
Write-Host Download AL Symbols
& (Join-path $PSScriptRoot 'Download-ALSymbols.ps1')
Write-Host Build AL Solution with Tests
& (Join-path $PSScriptRoot 'Build-ALSolutions.ps1')
Write-Host Install AL Extension
& (Join-path $PSScriptRoot 'Install-ALExtensionsToDocker.ps1')
Write-Host Execute AL Test Codeunits
& (Join-path $PSScriptRoot 'Start-ALTestsExecution.ps1')
Write-Host Save Test Results
& (Join-path $PSScriptRoot 'Save-TestResults.ps1')
Write-Host Remove Test Code
& (Join-path $PSScriptRoot 'Remove-ALTestFolders.ps1')
Write-Host Build AL Solution without Tests
& (Join-path $PSScriptRoot 'Build-ALSolutions.ps1')
Write-Host Copy AL Solution to Artifact folder
& (Join-path $PSScriptRoot 'Copy-ALSolutionToArtifactStagingDirectory.ps1')
Write-Host Sign AL Solution in Artifact folder
& (Join-path $PSScriptRoot 'Sign-ArtifactAppPackage.ps1')