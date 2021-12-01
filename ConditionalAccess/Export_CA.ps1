# Export your Conditional Access policies to a JSON file for backup.
$Parameters = @{
    ClientID = '6d56e495-a025-4e63-b0a7-3d759624fd52'
    ClientSecret = ''
    FilePath = 'C:\Temp\Conditional Access Backup.json'
}

Export-DCConditionalAccessPolicyDesign @Parameters