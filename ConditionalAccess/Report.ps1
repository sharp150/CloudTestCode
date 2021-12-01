# Export Conditional Access policy design report to Excel.
$Parameters = @{
    ClientID = '6d56e495-a025-4e63-b0a7-3d759624fd52'
    ClientSecret = 'lIL7Q~GTNVaeZSxOMkVuVRVN8fsaGcc_-LSo2'
}

New-DCConditionalAccessPolicyDesignReport @Parameters