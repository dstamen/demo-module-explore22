$ModuleSettings = @{
    RootModule = './demo-module-explore22.psm1'
    ModuleVersion = '1.0.2'
    Author = 'David Stamen'
    Description  = 'This is a demo created for VMware Explore 2022'
    FunctionsToExport = "Get-VMClusterInfo"
}
$ModuleSettings

New-ModuleManifest @ModuleSettings -Path './demo-module-explore22.psd1'
Test-ModuleManifest -Path ./demo-module-explore22.psd1