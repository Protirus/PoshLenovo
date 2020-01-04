---
external help file: PoshLenovo-help.xml
Module Name: PoshLenovo
online version: http://go.microsoft.com/fwlink/?LinkId=821583
schema: 2.0.0
---

# Log-Message

## SYNOPSIS

## SYNTAX

```
Log-Message [-message] <String> [-authority] <LogSource> [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```
Log-Message "Hello" Debug
```

## PARAMETERS

### -message
The message you wish to add to the Logs.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -authority
The authority LogSource.

```yaml
Type: LogSource
Parameter Sets: (All)
Aliases:
Accepted values: Audit, Debug

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
