<#
.EXTERNALHELP PSCompliance-help.xml
#>
function Get-LaMailboxInPlaceHold {

    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $false)]
        [switch] $WithoutInPlaceHold,
        
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)]
        [object[]]$list
    )
    Begin {
        $resultArray = @()
        $findParameter = "InPlaceHolds"
        $mailboxProperties = @("displayname", "userprincipalname", "IsInactiveMailbox", "accountdisabled", "RecipientTypeDetails", "inplaceholds")
        $mbxSearch = Get-MailboxSearch -ResultSize unlimited | select name, inplaceholdidentity, Status, version, StartDate, EndDate, sourcemailboxes, ItemHoldPeriod
                
        $hash = @{}
        foreach ($sRow in $mbxSearch) {
            foreach ($id in $sRow.InPlaceHoldIdentity) {
                $hash[$id] = $sRow 
            }
        }
    }
    Process {
        if (!($WithoutInPlaceHold)) {
            $each = Get-Mailbox -Identity $_.userprincipalname
            foreach ($mailbox in $each) {   
                ForEach ($guid in $mailbox.$findParameter) {
                    if (!($guid.Substring(0, 3) -eq "mbx") -and !($guid.Substring(0, 1) -eq "-") -and !($guid.Substring(0, 3) -eq "uni") -and !($guid.Substring(0, 3) -eq "skp")) {
                        $mailboxHash = @{}
                        $mailboxHash['InPlaceHoldName'] = ($hash[$guid]).name
                        $mailboxHash['StatusofHold'] = ($hash[$guid]).Status
                        $mailboxHash['StartDate'] = ($hash[$guid]).StartDate
                        $mailboxHash['EndDate'] = ($hash[$guid]).EndDate    
                        $mailboxHash['ItemHoldPeriod'] = ($hash[$guid]).ItemHoldPeriod   
                        foreach ($field in $mailboxProperties) {
                            $mailboxHash[$field] = ($mailbox.$field) -join ","
                        }                                            
                        $resultArray += [psCustomObject]$mailboxHash
                    }
                }
            }
        }
        else {
            $each = Get-Mailbox -Identity $_.userprincipalname | where {$_.inplaceholds -eq $null}
            foreach ($mailbox in $each) {   
                ForEach ($guid in $mailbox.$findParameter) {
                    if (!($guid.Substring(0, 3) -eq "mbx") -and !($guid.Substring(0, 1) -eq "-") -and !($guid.Substring(0, 3) -eq "uni") -and !($guid.Substring(0, 3) -eq "skp")) {
                        $mailboxHash = @{}
                        $mailboxHash['InPlaceHoldName'] = ($hash[$guid]).name
                        $mailboxHash['StatusofHold'] = ($hash[$guid]).Status
                        $mailboxHash['StartDate'] = ($hash[$guid]).StartDate
                        $mailboxHash['EndDate'] = ($hash[$guid]).EndDate    
                        $mailboxHash['ItemHoldPeriod'] = ($hash[$guid]).ItemHoldPeriod   
                        foreach ($field in $mailboxProperties) {
                            $mailboxHash[$field] = ($mailbox.$field) -join ","
                        }                                            
                        $resultArray += [psCustomObject]$mailboxHash       
                    }
                }
            }
        }
    }
    End {
        $resultArray | Select displayname, userprincipalname, InPlaceHoldName, IsInactiveMailbox, accountdisabled, ItemHoldPeriod, RecipientTypeDetails, StatusofHold, StartDate, EndDate, inplaceholds
    }
}