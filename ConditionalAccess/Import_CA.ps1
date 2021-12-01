# Import Conditional Access policies from a JSON file exported by Export-DCConditionalAccessPolicyDesign.
$Parameters = @{
    ClientID = '6d56e495-a025-4e63-b0a7-3d759624fd52'
    ClientSecret = ''
    FilePath = 'C:\Temp\Conditional Access Backup.json'
    SkipReportOnlyMode = $false
    DeleteAllExistingPolicies = $false
}

Import-DCConditionalAccessPolicyDesign @Parameters