Function label {
    <#
    .SYNOPSIS
    Creates a <label> HTML element tag


    .EXAMPLE

    label
    .EXAMPLE
    label "woop1" -Class "class"

    .EXAMPLE

    <form>
    <fieldset>
        <label>Personalia:</label>
        Name: <input type="text" size="30"><br>
        Email: <input type="text" size="30"><br>
        Date of birth: <input type="text" size="10">
    </fieldset>
    </form>

    .Notes
    Author: Stéphane van Gulick
    Current version 3.2
    History: 
        2018.11.11;@ChristopheKumor;Updated to version 3.2
        2018.10.30;@ChristopheKumor;Updated to version 3.0
        2018.05.09;@Stephanevg; Creation
    .LINK
        https://github.com/Stephanevg/PSHTML
    #>
    [Cmdletbinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [AllowEmptyString()]
        [AllowNull()]
        $Content,

        [AllowEmptyString()]
        [AllowNull()]
        [String]$Class,

        [String]$Id,

        [Hashtable]$Attributes
    )


    $tagname = "label"

    Set-HtmlTag -TagName $tagname -TagType NonVoid -Cmdlet $PSCmdlet



}
