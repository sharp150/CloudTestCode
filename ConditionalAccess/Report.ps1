# Export Conditional Access policy design report to Excel.
$Parameters = @{
    ClientID = '2612879e-30c5-45f3-9fcd-dc890cf914aa'
    ClientSecret = ''
}

New-DCConditionalAccessPolicyDesignReport @Parameters