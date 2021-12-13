# Export your Conditional Access policies to a JSON file for backup.
$Parameters = @{
    ClientID = '2612879e-30c5-45f3-9fcd-dc890cf914aa'
    ClientSecret = ''
    FilePath = 'C:\Temp\MGProdConditionalAccessBackup.json'
}

Export-DCConditionalAccessPolicyDesign @Parameters