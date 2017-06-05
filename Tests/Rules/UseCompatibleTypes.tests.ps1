$directory = Split-Path -Parent $MyInvocation.MyCommand.Path
$testRootDirectory = Split-Path -Parent $directory

Import-Module PSScriptAnalyzer
Import-Module (Join-Path $testRootDirectory "PSScriptAnalyzerTestHelper.psm1")

Describe "UseCompatibleTypes" {
    Context "When an incompatible type is given" {
        It "Should detect the incompatible type" {
            $def = @'
[string]$x = "hello"
'@
            $violations = Invoke-ScriptAnalyzer -ScriptDefinition $def -IncludeRule "PSUseCompatibleTypes"
            $violations.Count | Should Be 1
        }
    }
}
