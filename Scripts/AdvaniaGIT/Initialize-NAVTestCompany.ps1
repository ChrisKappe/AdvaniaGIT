﻿function Initialize-NAVTestCompany
{
    param
    (
    [Parameter(Mandatory=$True, ValueFromPipelineByPropertyname=$true)]
    [PSObject]$SetupParameters,
    [Parameter(Mandatory=$True, ValueFromPipelineByPropertyname=$true)]
    [PSObject]$BranchSettings
    )   

    Sync-NAVTenant -ServerInstance $BranchSettings.instanceName -Tenant default -Mode Sync -Force 
    if ($SetupParameters.navRelease -ge '2018') {
        Start-NAVDataUpgrade -ServerInstance $BranchSettings.instanceName -Tenant default -Language is-IS -ContinueOnError -FunctionExecutionMode Parallel -Force -SkipAppVersionCheck
    } else {
        Start-NAVDataUpgrade -ServerInstance $BranchSettings.instanceName -Tenant default -Language is-IS -ContinueOnError -FunctionExecutionMode Parallel -Force
    }
    Get-NAVDataUpgrade -ServerInstance $BranchSettings.instanceName -Tenant default -Progress

}