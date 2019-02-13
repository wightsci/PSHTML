Function ConvertTo-PSHTMLTable {

    <#
    .SYNOPSIS
        Converts a powershell object to a HTML table.
    
    .DESCRIPTION
        This cmdlet is intended to be used when powershell objects should be rendered in an HTML table format.
    
    .PARAMETER Object
        Specifies the object to use
    
    .PARAMETER Properties
        Properties you want as table headernames
    
    .EXAMPLE
        $service = Get-Service -Name Sens,wsearch,wscsvc | Select-Object -Property DisplayName,Status,StartType
        ConvertTo-PSHTMLtable -Object $service
    
    .EXAMPLE
        $proc = Get-Process | Select-Object -First 2
        ConvertTo-PSHTMLtable -Object $proc 
    
    .EXAMPLE
        $proc = Get-Process | Select-Object -First 2
        ConvertTo-PSHTMLtable -Object $proc -properties name,handles
    
        Returns the following HTML code
    
        <table>
            <thead>
                <tr>
                    <td>name</td>
                    <td>handles</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>AccelerometerSt</td>
                    <td>155</td>
                </tr>
                <tr>
                    <td>AgentService</td>
                    <td>190</td>
                </tr>
            </tbody>
        </table>
    
    .NOTES
            Current version 0.7.1
            History:
            2018.05.09;stephanevg;Made Linux compatible (changed Get-Serv).
            2018.10.14;Christophe Kumor;Update.
            2018.05.09;stephanevg;Creation.
            
    
    .LINK
        https://github.com/Stephanevg/PSHTML
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Object,
        [String[]]$Properties,

        [String]$Caption,

        [String]$TableID,
        [String]$TableClass,
        [String]$TableStyle,
        [HashTable]$TableAttributes,

        [String]$TheadId,
        [String]$TheadClass,
        [String]$TheadStyle,
        [HashTable]$TheadAttributes,

        [String]$TBodyId,
        [String]$TBodyClass,
        [String]$TBodyStyle,
        [HashTable]$TBodyAttributes
    )
    
    
    if ($Properties) {
        $HeaderNames = $Properties
    }
    else {
        $props = $Object | Get-Member -MemberType Properties | Select-Object Name
        $HeaderNames = @()
        foreach ($i in $props) {
            $HeaderNames += $i.name.tostring()

        }

    }


    #Table parameters
    $TableParams = @{}
    if ($TableID) {
        $TableParams.Id = $TableID
    }

    if ($TableClass) {
        $TableParams.Class = $TableClass
    }

    if ($TableStyle) {
        $TableParams.Style = $TableStyle
    }

    $TheadParams = @{}

    if ($TheadId) {
        $TheadParams.id = $TheadId
    }

    if ($TheadClass) {
        $TheadParams.Class = $TheadClass
    }

    if ($TheadStyle) {
        $TheadParams.Style = $TheadStyle
    }

    if ($TheadAttributes) {
        $TheadParams.Attributes = $TheadAttributes
    }

    $TBodyParams = @{}

    if ($TBodyId) {
        $TBodyParams.Id = $TBodyId
    }

    if ($TBodyClass) {
        $TBodyParams.Class = $TBodyClass
    }

    If ($TBodyStyle) {
        $TBodyParams.Style = $TBodyStyle
    }

    If ($TBodyAttributes) {
        $TBodyParams.Attributes = $TBodyAttributes
    }

    #tfoot
    $TFootParams = @{}
    if ($TFootId) {
        $TFootParams.Id = $TFootId
    }

    if ($TFootClass) {
        $TFootParams.Class = $TFootClass
    }

    if ($TFootStyle) {
        $TFootParams.Style = $TFootStyle
    }

    If ($TFootAttributes) {
        $TFootParams.Attributes = $TFootAttributes
    }

    table @TableParams -content {
        if ($Caption) {
            Caption -Content {
                $Caption
            }
        }
        thead @TheadParams -content {
    
            tr {
    
                foreach ($Name in $HeaderNames) {
    
                    td {
                        $Name
                    }
    
                }
    
            }
    
        }
    
        tbody @TBodyParams {

            foreach ($item in $Object) {
    
                tr {
                    
                    foreach ($propertyName in $HeaderNames) {

                        td {
                            $item.$propertyName
                        }
                     
                    }
    
                }

            }
    
        }

    }
}
