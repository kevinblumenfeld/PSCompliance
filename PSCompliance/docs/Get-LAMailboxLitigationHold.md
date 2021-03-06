---
external help file: PSCompliance-help.xml
online version: 
schema: 2.0.0
---

# Get-LaMailboxLitigationHold

## SYNOPSIS
Reports on all mailboxes and whether or not they are on Litigation Hold.
 
Additionally, can report on all mailboxes that do not have litigation hold enabled.

## SYNTAX

```
Get-LaMailboxLitigationHold [-LitigationHoldDisabledOnly] [-list] <Object[]> [<CommonParameters>]
```

## DESCRIPTION
Reports on all mailboxes and whether or not they are on Litigation Hold.
 
Additionally, can report on all mailboxes that do not have litigation hold enabled.

Mailbox UPNs should be passed from the pipeline as demonstrated in the examples below.

Individual mailboxes, all mailboxes, all mailboxes in a department are all possibilities.

Also demonstrated in an example below is importing mailboxes (UPNs) from a CSV

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-Mailbox -ResultSize unlimited | Select UserPrincipalName | Get-LaMailboxLitigationHold | Out-GridView
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-Mailbox -ResultSize unlimited | Select UserPrincipalName | Get-LaMailboxLitigationHold | Export-Csv .\litigationholds.csv -NoTypeInformation
```

### -------------------------- EXAMPLE 3 --------------------------
```
Get-Mailbox -ResultSize unlimited | Select UserPrincipalName | Get-LaMailboxLitigationHold -LitigationHoldDisabledOnly | Export-Csv .\litigationholds.csv -NoTypeInformation
```

** This example only reports on those that do NOT have Litigation Hold Enabled (notice the switch -LitigationHoldDisabledOnly) **

### -------------------------- EXAMPLE 4 --------------------------
```
Import-Csv .\upns.csv | Get-LaMailboxLitigationHold | Export-Csv .\litholds.csv -NoTypeInformation
```

### -------------------------- EXAMPLE 5 --------------------------
```
Get-MsolUser -All -Department 'Human Resources' | Select UserPrincipalName | Get-LaMailboxLitigationHold | Export-Csv .\HRlitigationholds.csv -NoTypeInformation
```

### -------------------------- EXAMPLE 6 --------------------------
```
A CSV could look like this

UserPrincipalName
user01@contoso.com
user02@contoso.com
```

## PARAMETERS

### -LitigationHoldDisabledOnly
{{Reports on Mailboxes the have Litigation Hold Disabled}}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -list
{{UPNs passed from the pipeline}}

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

