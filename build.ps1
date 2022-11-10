#Varibales
$ModuleSettings = @{
    RootModule = './demo-module-explore22.psm1'
    ModuleVersion = '2.1.0'
    Author = 'David Stamen'
    Description  = 'This is a demo created for VMware Explore 2022'
    FunctionsToExport = "Get-VMClusterInfo"
    IconURI = 'https://github.com/dstamen/demo-module-explore22/raw/main/logo.png'
}

#Create Manifest
New-ModuleManifest @ModuleSettings -Path './demo-module-explore22.psd1' -PassThru

#Test Manifest
Test-ModuleManifest -Path ./demo-module-explore22.psd1

#Publish Module
$APIKey = 'oy2fsh5m3psdvin6kfhaw3sd4xqyjybe5ji73ztp2ns3ci'
Publish-Module -Path . -NuGetApiKey $APIKey