function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$MountPoint,

        [ValidateSet("AdAccountOrGroupProtector","PasswordProtector","Pin","RecoveryKeyProtector","RecoveryPasswordProtector","StartupKeyProtector","TpmProtector")]
		[parameter(Mandatory = $true)]
		[System.String]
		$PrimaryProtector,

		[System.String]
		$AdAccountOrGroup,

		[System.Boolean]
		$AdAccountOrGroupProtector,

		[System.Boolean]
		$AllowImmediateReboot = $false,

		[System.Boolean]
		$AutoUnlock = $false,

		[ValidateSet("Aes128","Aes256")]
		[System.String]
		$EncryptionMethod,

		[System.Boolean]
		$HardwareEncryption,

		[System.Management.Automation.PSCredential]
		$Password,

		[System.Boolean]
		$PasswordProtector,

		[System.Management.Automation.PSCredential]
		$Pin,

		[System.String]
		$RecoveryKeyPath,

		[System.Boolean]
		$RecoveryKeyProtector,

		[System.Boolean]
		$RecoveryPasswordProtector,

		[System.Boolean]
		$Service,

		[System.Boolean]
		$SkipHardwareTest,

		[System.String]
		$StartupKeyPath,

		[System.Boolean]
		$StartupKeyProtector,

		[System.Boolean]
		$TpmProtector,

		[System.Boolean]
		$UsedSpaceOnly
	)

    #Load helper module
    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\msBitlockerCommon.psm1" -Verbose:0

    CheckForPreReqs

    $blv = Get-BitLockerVolume -MountPoint $MountPoint -ErrorAction SilentlyContinue

    if ($blv -ne $null)
    {
	    $returnValue = @{
		    MountPoint = $MountPoint
		    VolumeStatus = $blv.VolumeStatus
            KeyProtectors = $blv.KeyProtector
            EncryptionMethod = $blv.EncryptionMethod
	    }
    }

	$returnValue
}


function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$MountPoint,

        [ValidateSet("AdAccountOrGroupProtector","PasswordProtector","Pin","RecoveryKeyProtector","RecoveryPasswordProtector","StartupKeyProtector","TpmProtector")]
		[parameter(Mandatory = $true)]
		[System.String]
		$PrimaryProtector,

		[System.String]
		$AdAccountOrGroup,

		[System.Boolean]
		$AdAccountOrGroupProtector,

		[System.Boolean]
		$AllowImmediateReboot = $false,

		[System.Boolean]
		$AutoUnlock = $false,

		[ValidateSet("Aes128","Aes256")]
		[System.String]
		$EncryptionMethod,

		[System.Boolean]
		$HardwareEncryption,

		[System.Management.Automation.PSCredential]
		$Password,

		[System.Boolean]
		$PasswordProtector,

		[System.Management.Automation.PSCredential]
		$Pin,

		[System.String]
		$RecoveryKeyPath,

		[System.Boolean]
		$RecoveryKeyProtector,

		[System.Boolean]
		$RecoveryPasswordProtector,

		[System.Boolean]
		$Service,

		[System.Boolean]
		$SkipHardwareTest,

		[System.String]
		$StartupKeyPath,

		[System.Boolean]
		$StartupKeyProtector,

		[System.Boolean]
		$TpmProtector,

		[System.Boolean]
		$UsedSpaceOnly
	)

    #Load helper module
    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\msBitlockerCommon.psm1" -Verbose:0
      
    CheckForPreReqs

    EnableBitlocker @PSBoundParameters -VerbosePreference $VerbosePreference
}

function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$MountPoint,

        [ValidateSet("AdAccountOrGroupProtector","PasswordProtector","Pin","RecoveryKeyProtector","RecoveryPasswordProtector","StartupKeyProtector","TpmProtector")]
		[parameter(Mandatory = $true)]
		[System.String]
		$PrimaryProtector,

		[System.String]
		$AdAccountOrGroup,

		[System.Boolean]
		$AdAccountOrGroupProtector,

		[System.Boolean]
		$AllowImmediateReboot = $false,

		[System.Boolean]
		$AutoUnlock = $false,

		[ValidateSet("Aes128","Aes256")]
		[System.String]
		$EncryptionMethod,

		[System.Boolean]
		$HardwareEncryption,

		[System.Management.Automation.PSCredential]
		$Password,

		[System.Boolean]
		$PasswordProtector,

		[System.Management.Automation.PSCredential]
		$Pin,

		[System.String]
		$RecoveryKeyPath,

		[System.Boolean]
		$RecoveryKeyProtector,

		[System.Boolean]
		$RecoveryPasswordProtector,

		[System.Boolean]
		$Service,

		[System.Boolean]
		$SkipHardwareTest,

		[System.String]
		$StartupKeyPath,

		[System.Boolean]
		$StartupKeyProtector,

		[System.Boolean]
		$TpmProtector,

		[System.Boolean]
		$UsedSpaceOnly
	)

    #Load helper module
    Import-Module "$((Get-Item -LiteralPath "$($PSScriptRoot)").Parent.Parent.FullName)\Misc\msBitlockerCommon.psm1" -Verbose:0

    CheckForPreReqs

    $testResult = TestBitlocker @PSBoundParameters -VerbosePreference $VerbosePreference

    return $testResult
}

Export-ModuleMember -Function *-TargetResource

