Describe "Test for 17_mad_libs" {
    BeforeAll {
        $Script:prg = ".\mad.ps1"
    }

    It "Should exist" {
        Test-Path $Script:prg | Should -Be $true
    }

    It "Test fox" {
        $fox = '.\inputs\fox.txt'

        $actual = &$Script:prg $fox -i surly, car, under, bicycle

        $actual | Should -BeExactly 'The quick surly car jumps under the lazy bicycle.'
    }
}
