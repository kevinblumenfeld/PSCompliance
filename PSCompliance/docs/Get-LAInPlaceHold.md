---
external help file: PSCompliance-help.xml
online version: 
schema: 2.0.0
---

# Get-LaInPlaceHold

## SYNOPSIS
Reports on in-place holds from the legacy, Exchange specific, "Compliance Management \> in-place eDiscovery & hold"

## SYNTAX

```
Get-LaInPlaceHold [<CommonParameters>]
```

## DESCRIPTION
Reports on in-place holds from the legacy, Exchange specific, "Compliance Management \> in-place eDiscovery & hold"
This does not report on each mailbox that is on hold - Use Get-LaMailboxInPlaceHold to report on that (however that command provides only the legacy holds).
To report on modern holds, use Get-LaComplianceCase to report on in-place holds from the new "Security and Compliance Center".

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-LaInPlaceHold | Export-Csv ./LegacyHolds.csv -NoTypeInformation
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-LaInPlaceHold | Out-GridView
```

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

