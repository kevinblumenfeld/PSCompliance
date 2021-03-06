---
external help file: PSCompliance-help.xml
online version: 
schema: 2.0.0
---

# Get-LaComplianceSearch

## SYNOPSIS
Reports on Compliance Searches (the predecessor to Get-MailboxSearch)

## SYNTAX

```
Get-LaComplianceSearch [-SharePoint] [-PublicFolder] [-All] [<CommonParameters>]
```

## DESCRIPTION
Reports on Compliance Searches in the Office 365 Security & Compliance Center. 
The command New-ComplianceSearch does not put any mailboxes on hold, therefor this only reports on searches.
Holds are all now created through eDiscovery cases in the Office 365 Security & Compliance Center.
Again, this report simply reports on "Searches"

Make sure you are first connected to the Office 365 compliance service. 
Simply use Get-LaConnected,  e.g.
Get-LaConnected -Tenant Contoso -Compliance

** If run with the All switch, it will output all the searches, one per row and a column for each location (all locations of Exchange, SharePoint & PublicFolders)
  ** this report will report on everything

If run with no switches, it will output all included Exchange mailboxes with each search name
If run with the SharePoint switch, it will output all included SharePoint Sites with each search name
If run with the PublicFolder switch, it will output if All or None of the Public Folders are searched with each search name

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-LaComplianceSearch | Export-Csv ./Exchangecompliancesearch.csv -NoTypeInformation
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-LaComplianceSearch -SharePoint | Export-Csv ./SharePointSearches.csv -NoTypeInformation
```

### -------------------------- EXAMPLE 3 --------------------------
```
Get-LaComplianceSearch -OneDrive | Export-Csv ./OneDriveSearches.csv -NoTypeInformation
```

### -------------------------- EXAMPLE 4 --------------------------
```
Get-LaComplianceSearch -PublicFolder | Export-Csv ./PublicFolderSearches.csv -NoTypeInformation
```

### -------------------------- EXAMPLE 5 --------------------------
```
Get-LaComplianceSearch -All | Export-Csv ./AllSearchesAllLocations.csv -NoTypeInformation
```

## PARAMETERS

### -SharePoint
{{SharePoint Locations}}

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

### -PublicFolder
{{PublicFolder Locations}}

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

### -All
{{All Locations}}

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

