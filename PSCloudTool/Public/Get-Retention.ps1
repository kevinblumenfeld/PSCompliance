function Find-Retention() {
    [CmdletBinding()]
    Param
    (

    )
    Begin {

    }
    Process {
        $resultArray = @()
        $findParameter = "RetentionPolicyTagLinks"
        $retPols = Get-RetentionPolicy | Select name, identity, IsDefault, RetentionPolicyTagLinks
        $retTags = Get-RetentionPolicyTag
        $retPolProps = $retPols | Get-Member -MemberType 'NoteProperty' | Select Name
        
        $tagHash = @{}
        foreach ($tag in $retTags) {
            foreach ($id in $tag.name) {
                $tagHash[$id] = $tag 
            }
        }
      
        foreach ($row in $retPols) {           
            ForEach ($link in $row.$findParameter) {
                $polHash = @{}
                $polHash['TagName'] = ($tagHash[$link]).name
                $polHash['TagType'] = ($tagHash[$link]).type
                $polHash['TagEnabled'] = ($tagHash[$link]).RetentionEnabled
                $polHash['TagAgeLimit'] = ($tagHash[$link]).AgeLimitForRetention  
                $polHash['TagAction'] = ($tagHash[$link]).RetentionAction
                $polHash['TagComment'] = ($tagHash[$link]).Comment                                             
                foreach ($field in $retPolProps.name) {
                    $polHash[$field] = ($row.$field) -join ","
                }  
                $resultArray += [psCustomObject]$polHash        
            }
        }
    }
    End {
        [psCustomObject]$resultArray
    }
}
