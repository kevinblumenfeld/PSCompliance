---
external help file: PSCompliance-help.xml
online version: 
schema: 2.0.0
---

# Get-LAMailboxRetentionPolicy

## SYNOPSIS
Reports on which retention policy a mailbox or mailboxes have.

## SYNTAX

```
Get-LAMailboxRetentionPolicy [-list] <String[]>
```

## DESCRIPTION
Reports on which retention policy a mailbox or mailboxes have.
Mailbox UPNs should be passed from the pipeline as demonstrated in the examples below.

Individual mailboxes, all mailboxes, all mailboxes in a department are all possibilities.

Also demonstrated in an example below is importing mailboxes (UPNs) from a CSV

A CSV could look like this

UserPrincipalName
user01@contoso.com
user02@contoso.com
user03@contoso.com
user04@contoso.com

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-Mailbox -ResultSize unlimited | Select UserPrincipalName | Get-LAMailboxRetentionPolicy | Out-GridView
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-Mailbox -ResultSize unlimited | Select UserPrincipalName | Get-LAMailboxRetentionPolicy | Export-Csv .\retentionpolicyofmailboxes.csv -NoTypeInformation
```

### -------------------------- EXAMPLE 3 --------------------------
```
Import-Csv .\upns.csv | Get-LAMailboxRetentionPolicy | Export-Csv .\ListofMailboxesandtheirRetentionPolicy.csv -NoTypeInformation
```

### -------------------------- EXAMPLE 4 --------------------------
```
Get-MsolUser -All -Department 'Human Resources' | Select UserPrincipalName | Get-LAMailboxRetentionPolicy | Export-Csv .\HRdeptRetentionPolicy.csv -NoTypeInformation
```

## PARAMETERS

### -list
{{Fill list Description}}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
