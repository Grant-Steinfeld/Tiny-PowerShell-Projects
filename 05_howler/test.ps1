Describe "Test for 05_howler" {
    BeforeAll {
        $Script:prg = ".\howler.ps1"
    }

    It "Should exist" {
        Test-Path $Script:prg | Should -Be $true
    }

    It "Test a string" {
        &$Script:prg 'foo bar baz' | Should -BeExactly 'FOO BAR BAZ'
    }

    It "Test a string to outfile" {
        $outFile = "TestDrive:\testOutfile.txt"

        &$Script:prg 'foo bar baz' -outFile $outFile 
        (Get-Content -Raw $outFile).Trim() | Should -BeExactly 'FOO BAR BAZ'
    }

    It "Test read a file" {
        $fileName = '..\inputFiles\preamble.txt'
        $expected = (Get-Content -Raw $fileName).ToUpper()
        
        &$Script:prg $fileName | Should -BeExactly $expected
    }

    It "Test read a file and outfile" {
        $fileName = '..\inputFiles\preamble.txt'
        $outFile = "TestDrive:\preambleOutFile.txt"
        
        &$Script:prg $fileName -outFile $outFile
        
        $actual = (Get-Content -Raw $fileName).Trim().ToUpper()
        $expected = (Get-Content -Raw $outFile).Trim().ToUpper()
        
        $actual | Should -BeExactly $expected
    }
}