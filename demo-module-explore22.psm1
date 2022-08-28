Function Get-VMClusterInfo {
<#
    .NOTES
    ===========================================================================
        Created by:    David Stamen
        Organization:  VMware
        Blog:          www.davidstamen.com
        Twitter:       @davidstamen
    ===========================================================================
    .SYNOPSIS
        This is a demo function created for Session to Build and Publish a Powershell Module
    .DESCRIPTION
        This is a demo function created for Session to Build and Publish a Powershell Module
    .EXAMPLE
        Get-VMClusterInfo -Server vc.lab.local -User administrator@vsphere.local -Password VMware1! -Cluster MyCluster01
#>
	Param(
		[parameter(Mandatory=$true)]
		[string] $Server,
		[parameter(Mandatory=$true)]
		[string] $Username,
		[parameter(Mandatory=$true)]
		[String] $Password,
        [parameter(Mandatory=$true)]
		[string] $Cluster
	)
    Connect-VIServer -Server $Server -User $Username -Password $Password  | Out-Null
    $ClusterInfo = Get-Cluster $Cluster
    $Hosts = Get-Cluster $Cluster | Get-VMHost

    $Hosts | ForEach-Object { $ClusterAvailableMemory += $_.MemoryTotalGB}
    $Hosts | ForEach-Object { $ClusterUsedMemory += $_.MemoryUsageGB}
    $Hosts | ForEach-Object { $ClusterAvailableCPU += $_.CpuTotalMhz}
    $Hosts | ForEach-Object { $ClusterUsedCPU += $_.CpuUsageMhz}


        $Result = [pscustomobject] @{
        "Cluster Name" = $ClusterInfo.Name;
        "Host Count" = $Hosts.Count
        "Cluster Available CPU (Mhz)" = $ClusterAvailableCPU
        "Cluster Used CPU (Mhz)" = $ClusterUsedCPU
        "Cluster Available Memory (GB)" = [math]::Round($ClusterAvailableMemory,2)
        "Cluster Used Memory (GB)" = [math]::Round($ClusterUsedMemory,2)
    }
    $Result
    Disconnect-VIServer -Server $Server -Confirm:$False  | Out-Null

}