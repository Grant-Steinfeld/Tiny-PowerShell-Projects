Describe "Test for 10_telephone" {
    BeforeAll {
        $Script:prg = ".\telephone.ps1"
    }

    It "Should exist" {
        Test-Path $Script:prg | Should -Be $true
    }

    It "Test echo" {
        $text = Get-Content -Raw ..\inputFiles\now.txt
                
        $actual = &$Script:prg $text -m 0
        # $actual = &$Script:prg $text.Trim() -m 0
        $expected =
        @"
You said: "{0}"
I heard : "{0}"
"@ -f $text

        $actual | Should -BeExactly $expected
    }

    It "Test now cmd s1" {
        $text = Get-Content -Raw ..\inputFiles\now.txt

        $actual = &$Script:prg $text -s 1
        $expected = @"
You said: "{0}"
I heard : "{1}"
"@ -f $text, "Now is the |ime for all gooU men tC come-to the aidXof the pa?ty."

        $actual | Should -BeExactly $expected
    }

    It "Test now cmd s2 m4" {
        $text = Get-Content -Raw ..\inputFiles\now.txt

        $actual = &$Script:prg $text -s 2 -m .4
        $expected = @"
You said: "Now is the time for all good men to come to the aid of the party."
I heard : "Now iT tx/ timy%for anl |oH; =enYto co-\hIZ G-e aiQLo>ltget!aWty."
"@
        $actual | Should -BeExactly $expected
    }

    It "Test fox file s1" {

        $actual = &$Script:prg ..\inputFiles\fox.txt -seed 1

        $expected = @"
You said: "The quick brown fox jumps over the lazy dog."
I heard : "The quick erowk fox jumps o>er the lazy drg."
"@
        $actual | Should -BeExactly $expected
    }

    It "Test fox file s2 m6" {

        $actual = &$Script:prg ..\inputFiles\fox.txt -seed 2 -mutations .6

        $expected = @"
You said: "The quick brown fox jumps over the lazy dog."
I heard : "BhV_qjicM;Two~,)EoO j)Cdb zv*&Itle lGzy{dpgo"
"@
        $actual | Should -BeExactly $expected
    }    
}