
#Ceate new policy
$conditions = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessConditionSet
$conditions.Applications = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessApplicationCondition
$conditions.Applications.IncludeApplications = "All"
$conditions.Users = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessUserCondition
$conditions.Users.IncludeGroups = "59af29f0-6e18-4200-8ad6-00f925ce415a"
$conditions.Users.ExcludeGroups = "1485726d-411b-44ea-a77f-2c7f8db0b547"
$conditions.SignInRiskLevels = @('high', 'medium' ,'low')
$controls = New-Object -TypeName Microsoft.Open.MSGraph.Model.ConditionalAccessGrantControls
$controls._Operator = "OR"
$controls.BuiltInControls = "mfa"

#New-AzureADMSConditionalAccessPolicy -DisplayName "CA0002: Require MFA for medium + sign-in risk" -State "enabledForReportingButNotEnforced" -Conditions $conditions -GrantControls $controls
$policyid = '782d6bfd-44eb-4e78-8e7b-298a6e7fc3a4' #used after policy created
$state = 'enabledForReportingButNotEnforced' #or Enabled
$DisplayName = "TestConditionalAccessPolicies"
New-AzureADMSConditionalAccessPolicy -DisplayName $DisplayName -State $state -Conditions $conditions -GrantControls $controls


#Get all Ca policies
Get-AzureADMSConditionalAccessPolicy 

# Get specific policy by policy iD
Get-AzureADMSConditionalAccessPolicy -PolicyId $policyid 

            #view details of specific objects
            $policy = Get-AzureADMSConditionalAccessPolicy -PolicyId $policyid 
            $policy.Conditions.Users
            $policy.Conditions.Applications


#Update Ca policy
# disable security defaults from AAD to run
Set-AzureADMSConditionalAccessPolicy -PolicyId $policyid -DisplayName "CA002: Require MFA for medium + sign-in risk" -State $state -Conditions $conditions -GrantControls $controls

        # update additional groups
        $conditions.Users.IncludeGroups = @('5f6ed05f-c5f4-41d0-96d4-516e2abf825d', 'f5471a71-6fd7-475f-bd09-cda32245e3aa')


#Delete a CA Policy
Remove-AzureADMSConditionalAccessPolicy -PolicyId $policyid
