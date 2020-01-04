---
external help file: PoshLenovo-help.xml
Module Name: PoshLenovo
online version: http://go.microsoft.com/fwlink/?LinkId=821583
schema: 2.0.0
---

# Get-Content

## SYNOPSIS
Gets the content of the item at the specified location.

## SYNTAX

```
Get-Content [-Id] <String> [<CommonParameters>]
```

## DESCRIPTION
The Get-Content cmdlet gets the content of the item at the location specified by the path, such as the text in a file.
It reads the content one line at a time and returns a collection of objects, each of which represents a line of content.

Beginning in Windows PowerShell 3.0, this cmdlet can also get a specified number of lines from the beginning or end of an item.

## EXAMPLES

### EXAMPLE 1
```
Get-Content -Id "#ID#"
```

### Example 1: Get the content of a text file
```
PS C:\>Get-Content -Path "C:\Chapters\Chapter1.txt"
```

This command gets the content of the Chapter1.txt file.
It uses the Path parameter to specify the name of the item.
Get-Content passes the content down the pipeline, but because there are no other pipeline elements, the content is formatted by default and displayed at the command line.

### Example 2: Get the first 50 lines from a text file and store the results in another file
```
PS C:\>Get-Content "C:\Logs\Log060912.txt" -TotalCount 50 | Set-Content "Sample.txt"
```

This command gets the first 50 lines of the Log060912.txt file and stores them in the Sample.txt file.
The command uses the Get-Content cmdlet to get the text in the file.
(The name of Path parameter, which is optional, is omitted.) The TotalCount parameter limits the content retrieved to the first 50 lines.
The pipeline operator (|) sends the result to the Set-Content cmdlet, which places it in the Sample.txt file.

### Example 3: Get the fifth line of a text file
```
PS C:\>(Get-Content Cmdlets.txt -TotalCount 5)[-1]
```

This command gets the fifth line of the Cmdlets.txt text file.
It uses the TotalCount parameter to get the first five lines and then uses array notation to get the last line (indicated by "-1") of the resulting set.

### Example 4: Get the first and last line of a text file
```
PS C:\>dir .\*.txt | ForEach {Get-Content $_ -Head 1; Get-Content $_ -Tail 1}
```

This command gets the first and last lines of each text file in the current directory.
The command uses the Tail parameter and the Head alias of the TotalCount parameter

## PARAMETERS

### -Id
The Id number of the #

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
You cannot pipe input to this cmdlet.

## OUTPUTS

### System.Byte, System.String
This cmdlet returns strings or bytes.
The output type depends upon the content that it gets.

## NOTES
* This cmdlet is designed to work with the data exposed by any provider. To get the providers in your session, use the Get-PSProvider cmdlet. For more information, see about_Providers(http://go.microsoft.com/fwlink/?LinkID=113250).

*

## RELATED LINKS

[Add-Content]()

[Clear-Content]()

[Set-Content]()

[Get-PSProvider]()

