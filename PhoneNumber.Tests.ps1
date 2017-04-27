Describe "Testing function Test-PhoneNumber" {

    Import-Module $PSScriptRoot\TestPhoneNumber.psm1 -Force

    It "should not validate phone numbers of the wrong length (1)" {
        $actual = Test-PhoneNumber 1
        $actual | Should Be $false
    }

    It "should not validate phone numbers of the wrong length (7)" {
        $actual = Test-PhoneNumber 1123213
        $actual | Should Be $false
    }

    It "should not validate phone numbers of the wrong length (8)" {
        $actual = Test-PhoneNumber '13332-+==-/-/123'
        $actual | Should Be $false
    }

    It "should validate phone numbers of the right length (10)" {
        $actual = Test-PhoneNumber 7701234432
        $actual | Should Be $true
    }
    
    It "should validate phone numbers of the right length (11)" {
        $actual = Test-PhoneNumber 17701234432
        $actual | Should Be $true
    }

    It "should validate phone numbers of the right length (11)" {
        $actual = Test-PhoneNumber 17701234432
        $actual | Should Be $true
    }

    It "should not validate phone numbers with bad area codes" {
        $actual = Test-PhoneNumber '1-991-893-1233'
        $actual | Should Be $false
    }
   
    It 'should validate correct phone numbers with funky characters' {
        $actual = Test-PhoneNumber '+1 (770) 123-4432 oops//www.google.com'
        $actual | Should Be $true
    }

    It 'should not validate phone numbers with bad exchange codes' {
        $actual = Test-PhoneNumber '310 911 4432'
        $actual | Should Be $false
    }

    It 'should not validate directory assistance phone numbers' {
        $actual = Test-PhoneNumber '(352) 555-1212'
        $actual | Should Be $false
    }

    It 'should not validate national use phone numbers' {
        $actual = Test-PhoneNumber '(352) 555-1212'
        $actual | Should Be $false        
    }

    It 'should validate phone numbers that are not strings' {
        $actual = Test-PhoneNumber 17731345611
        $actual | Should Be $true        
    }

    It 'should not validate fictitious phone numbers' {
        $actual = Test-PhoneNumber '+ 1 949 555 0101'
        $actual | Should Be $false
    }
}