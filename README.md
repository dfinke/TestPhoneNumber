A PowerShell module that accurately validates phone numbers.

> Ported from https://github.com/dvx/fonz.js

A PowerShell module that can test phone numbers and inlucdes Pester tests.
## Examples
```powershell
$numbers = $(
1123213 
'13332-+==-/-/123'
7701234432
17701234432
'1-991-893-1233'
'+1 (770) 123-4432 oops//www.google.com'
'310 911 4432'
'17731345611'
'+ 1 949 555 0101'
)

$numbers | % {
    [PSCustomObject]@{
        Phone = $_
        IsValid = Test-PhoneNumber $_
    }
}
```

```
                                 Phone IsValid
                                 ----- -------
                               1123213   False
                      13332-+==-/-/123   False
                            7701234432    True
                           17701234432    True
                        1-991-893-1233   False
+1 (770) 123-4432 oops//www.google.com    True
                          310 911 4432   False
                           17731345611    True
                      + 1 949 555 0101   False
```