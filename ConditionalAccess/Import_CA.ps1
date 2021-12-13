# Import Conditional Access policies from a JSON file exported by Export-DCConditionalAccessPolicyDesign.
$Parameters = @{
    ClientID = '6d56e495-a025-4e63-b0a7-3d759624fd52'
    ClientSecret = 'r5n7Q~yQRkraiZAAudjOaOdOyHOithx7x9qFW'
    FilePath = 'C:\Temp\MGProdConditionalAccessBackup.json'
    SkipReportOnlyMode = $false
    DeleteAllExistingPolicies = $true
}

Import-DCConditionalAccessPolicyDesign @Parameters