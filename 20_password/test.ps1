Describe "Test for 20_password" {
    BeforeAll {
        $Script:prg = ".\password.ps1"
        $Script:words = '../inputFiles/words.txt'
    }

    It "Should exist" {
        Test-Path $Script:prg | Should -Be $true
    }

    It "Test defaults" {
        $actual = &$Script:prg -s 1 $Script:words
        $expected = $(
            'KvassBirdDoneySilked'
            'PraseJewGoelViand'
            'AlmaBerithDomettPitau'
        ) 

        $actual | Should -BeExactly $expected
    }
}
