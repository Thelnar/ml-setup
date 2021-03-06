$loc = 'C:\Users\Jeff\anaconda3'

cmd /c "$loc\Scripts\activate.bat $loc"

$codeCertificate = Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Subject -eq "CN=ATA Authenticode"}

Set-AuthenticodeSignature -FilePath $loc\shell\condabin\Conda.psm1 -Certificate $codeCertificate -TimeStampServer http://timestamp.digicert.com
Set-AuthenticodeSignature -FilePath $loc\shell\condabin\conda-hook.ps1 -Certificate $codeCertificate -TimeStampServer http://timestamp.digicert.com

# SIG # Begin signature block
# MIIWEAYJKozIhvcNAQcCoIIWATCCFf0CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQURhMLXefTjbKC1TE4p+l4zG2E
# eNygghCGMIIDBjCCAe6gAwIBAgIQeEas/OErQ7RJAL0v4xuEZTANBgkqhkiG9w0B
# AQsFADAbMRkwFwYDVQQDDBBBVEEgQXV0aGVudGljb2RlMB4XDTIyMDQyMTAyNDQx
# N1oXDTIzMDQyMTAzMDQxN1owGzEZMBcGA1UEAwwQQVRBIEF1dGhlbnRpY29kZTCC
# ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJg18hMvijqbqFk1PWQ6rpMM
# iubVVHp+HuThUGJLruJROBOFz2sFt12z22c8fBkGWN55Fefwd9P5igYszz8i9bbv
# IujO9qci+KBlvbPN1OdmyJHydo2Hu7G5A0HSKuLXmQQ/Jq3+q95NO2kb9xsPGyEx
# yFtbRnQYw8huIYsJ/QAq14x/QQboRcMn8UMRGe99EYKMPC7jMVXAK9SjFMBik3TM
# GVZhr1s+fTWjibCBxV0HuhZ8NL4oqbmMttd4s0h/wxTkF7NK/oO9lMhwbR7ViG5T
# eARYWpU78ZZtNh1hdSeSoG+bh0gzvuPNtoSNAV7DuSsI/zrCzVVG14JuOsmG22kC
# AwEAAaNGMEQwDgYDVR0PAQH/BAQDAgeAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMB0G
# A1UdDgQWBBTYZ953lcKHEXKz+H+fP1AKQSOHeDANBgkqhkiG9w0BAQsFAAOCAQEA
# biLuB2QhhSPlLQIYBhIZbMfZCo+RMoX6IEgAp8F/WMeGtBA466LyrYcsfbxaUVIb
# aBVZ2P64iQ8WYYlZ5GACsKqV4qlOG8fw9t+9ENn5+tcW5eMdYMg7cO0IvxcvvqyU
# EyKj1CoQN42mG+8HGpzPsXisaNNTd6lbZuJDEylj8bnkzSIbWqGcj8rA1YIImtD5
# n5Mmv9q8hcAOpxGL21fLdAJb9f6h6Rp7A/r47qKD+Z5BUD8kY+afWtsFEzcx4X3i
# z/EsVOmcyopTbcsnGztKMQtCEJBNdIvU2Sb1qStTK+lZ3Pty1L1wiPlql2GuQCR9
# W7hSnz1bDFBSOY6NCWpW7jCCBq4wggSWoAMCAQICEAc2N7ckVHzYR6z9KGYqXlsw
# DQYJKoZIhvcNAQELBQAwYjELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0
# IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEhMB8GA1UEAxMYRGlnaUNl
# cnQgVHJ1c3RlZCBSb290IEc0MB4XDTIyMDMyMzAwMDAwMFoXDTM3MDMyMjIzNTk1
# OVowYzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMTswOQYD
# VQQDEzJEaWdpQ2VydCBUcnVzdGVkIEc0IFJTQTQwOTYgU0hBMjU2IFRpbWVTdGFt
# cGluZyBDQTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAMaGNQZJs8E9
# cklRVcclA8TykTepl1Gh1tKD0Z5Mom2gsMyD+Vr2EaFEFUJfpIjzaPp985yJC3+d
# H54PMx9QEwsmc5Zt+FeoAn39Q7SE2hHxc7Gz7iuAhIoiGN/r2j3EF3+rGSs+Qtxn
# jupRPfDWVtTnKC3r07G1decfBmWNlCnT2exp39mQh0YAe9tEQYncfGpXevA3eZ9d
# rMvohGS0UvJ2R/dhgxndX7RUCyFobjchu0CsX7LeSn3O9TkSZ+8OpWNs5KbFHc02
# DVzV5huowWR0QKfAcsW6Th+xtVhNef7Xj3OTrCw54qVI1vCwMROpVymWJy71h6aP
# TnYVVSZwmCZ/oBpHIEPjQ2OAe3VuJyWQmDo4EbP29p7mO1vsgd4iFNmCKseSv6De
# 4z6ic/rnH1pslPJSlRErWHRAKKtzQ87fSqEcazjFKfPKqpZzQmiftkaznTqj1QPg
# v/CiPMpC3BhIfxQ0z9JMq++bPf4OuGQq+nUoJEHtQr8FnGZJUlD0UfM2SU2LINIs
# VzV5K6jzRWC8I41Y99xh3pP+OcD5sjClTNfpmEpYPtMDiP6zj9NeS3YSUZPJjAw7
# W4oiqMEmCPkUEBIDfV8ju2TjY+Cm4T72wnSyPx4JduyrXUZ14mCjWAkBKAAOhFTu
# zuldyF4wEr1GnrXTdrnSDmuZDNIztM2xAgMBAAGjggFdMIIBWTASBgNVHRMBAf8E
# CDAGAQH/AgEAMB0GA1UdDgQWBBS6FtltTYUvcyl2mi91jGogj57IbzAfBgNVHSME
# GDAWgBTs1+OC0nFdZEzfLmc/57qYrhwPTzAOBgNVHQ8BAf8EBAMCAYYwEwYDVR0l
# BAwwCgYIKwYBBQUHAwgwdwYIKwYBBQUHAQEEazBpMCQGCCsGAQUFBzABhhhodHRw
# Oi8vb2NzcC5kaWdpY2VydC5jb20wQQYIKwYBBQUHMAKGNWh0dHA6Ly9jYWNlcnRz
# LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRSb290RzQuY3J0MEMGA1UdHwQ8
# MDowOKA2oDSGMmh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0
# ZWRSb290RzQuY3JsMCAGA1UdIAQZMBcwCAYGZ4EMAQQCMAsGCWCGSAGG/WwHATAN
# BgkqhkiG9w0BAQsFAAOCAgEAfVmOwJO2b5ipRCIBfmbW2CFC4bAYLhBNE88wU86/
# GPvHUF3iSyn7cIoNqilp/GnBzx0H6T5gyNgL5Vxb122H+oQgJTQxZ822EpZvxFBM
# Yh0MCIKoFr2pVs8Vc40BIiXOlWk/R3f7cnQU1/+rT4osequFzUNf7WC2qk+RZp4s
# nuCKrOX9jLxkJodskr2dfNBwCnzvqLx1T7pa96kQsl3p/yhUifDVinF2ZdrM8HKj
# I/rAJ4JErpknG6skHibBt94q6/aesXmZgaNWhqsKRcnfxI2g55j7+6adcq/Ex8HB
# anHZxhOACcS2n82HhyS7T6NJuXdmkfFynOlLAlKnN36TU6w7HQhJD5TNOXrd/yVj
# mScsPT9rp/Fmw0HNT7ZAmyEhQNC3EyTN3B14OuSereU0cZLXJmvkOHOrpgFPvT87
# eK1MrfvElXvtCl8zOYdBeHo46Zzh3SP9HSjTx/no8Zhf+yvYfvJGnXUsHicsJttv
# FXseGYs2uJPU5vIXmVnKcPA3v5gA3yAWTyf7YGcWoWa63VXAOimGsJigK+2VQbc6
# 1RWYMbRiCQ8KvYHZE/6/pNHzV9m8BPqC3jLfBInwAM1dwvnQI38AC+R2AibZ8GV2
# QqYphwlHK+Z/GqSFD/yYlvZVVCsfgPrA8g4r5db7qS9EFUrnEw4d2zc4GqEr9u3W
# fPwwggbGMIIErqADAgECAhAKekqInsmZQpAGYzhNhpedMA0GCSqGSIb3DQEBCwUA
# MGMxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE7MDkGA1UE
# AxMyRGlnaUNlcnQgVHJ1c3RlZCBHNCBSU0E0MDk2IFNIQTI1NiBUaW1lU3RhbXBp
# bmcgQ0EwHhcNMjIwMzI5MDAwMDAwWhcNMzMwMzE0MjM1OTU5WjBMMQswCQYDVQQG
# EwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4xJDAiBgNVBAMTG0RpZ2lDZXJ0
# IFRpbWVzdGFtcCAyMDIyIC0gMjCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoC
# ggIBALkqliOmXLxf1knwFYIY9DPuzFxs4+AlLtIx5DxArvurxON4XX5cNur1JY1D
# o4HrOGP5PIhp3jzSMFENMQe6Rm7po0tI6IlBfw2y1vmE8Zg+C78KhBJxbKFiJgHT
# zsNs/aw7ftwqHKm9MMYW2Nq867Lxg9GfzQnFuUFqRUIjQVr4YNNlLD5+Xr2Wp/D8
# sfT0KM9CeR87x5MHaGjlRDRSXw9Q3tRZLER0wDJHGVvimC6P0Mo//8ZnzzyTlU6E
# 6XYYmJkRFMUrDKAz200kheiClOEvA+5/hQLJhuHVGBS3BEXz4Di9or16cZjsFef9
# LuzSmwCKrB2NO4Bo/tBZmCbO4O2ufyguwp7gC0vICNEyu4P6IzzZ/9KMu/dDI9/n
# w1oFYn5wLOUrsj1j6siugSBrQ4nIfl+wGt0ZvZ90QQqvuY4J03ShL7BUdsGQT5Ts
# hmH/2xEvkgMwzjC3iw9dRLNDHSNQzZHXL537/M2xwafEDsTvQD4ZOgLUMalpoEn5
# deGb6GjkagyP6+SxIXuGZ1h+fx/oK+QUshbWgaHK2jCQa+5vdcCwNiayCDv/vb5/
# bBMY38ZtpHlJrYt/YYcFaPfUcONCleieu5tLsuK2QT3nr6caKMmtYbCgQRgZTu1H
# m2GV7T4LYVrqPnqYklHNP8lE54CLKUJy93my3YTqJ+7+fXprAgMBAAGjggGLMIIB
# hzAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADAWBgNVHSUBAf8EDDAKBggr
# BgEFBQcDCDAgBgNVHSAEGTAXMAgGBmeBDAEEAjALBglghkgBhv1sBwEwHwYDVR0j
# BBgwFoAUuhbZbU2FL3MpdpovdYxqII+eyG8wHQYDVR0OBBYEFI1kt4kh/lZYRIRh
# p+pvHDaP3a8NMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwzLmRpZ2ljZXJ0
# LmNvbS9EaWdpQ2VydFRydXN0ZWRHNFJTQTQwOTZTSEEyNTZUaW1lU3RhbXBpbmdD
# QS5jcmwwgZAGCCsGAQUFBwEBBIGDMIGAMCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
# cC5kaWdpY2VydC5jb20wWAYIKwYBBQUHMAKGTGh0dHA6Ly9jYWNlcnRzLmRpZ2lj
# ZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNFJTQTQwOTZTSEEyNTZUaW1lU3RhbXBp
# bmdDQS5jcnQwDQYJKoZIhvcNAQELBQADggIBAA0tI3Sm0fX46kuZPwHk9gzkrxad
# 2bOMl4IpnENvAS2rOLVwEb+EGYs/XeWGT76TOt4qOVo5TtiEWaW8G5iq6Gzv0Uhp
# GThbz4k5HXBw2U7fIyJs1d/2WcuhwupMdsqh3KErlribVakaa33R9QIJT4LWpXOI
# xJiA3+5JlbezzMWn7g7h7x44ip/vEckxSli23zh8y/pc9+RTv24KfH7X3pjVKWWJ
# D6KcwGX0ASJlx+pedKZbNZJQfPQXpodkTz5GiRZjIGvL8nvQNeNKcEiptucdYL0E
# IhUlcAZyqUQ7aUcR0+7px6A+TxC5MDbk86ppCaiLfmSiZZQR+24y8fW7OK3NwJMR
# 1TJ4Sks3KkzzXNy2hcC7cDBVeNaY/lRtf3GpSBp43UZ3Lht6wDOK+EoojBKoc88t
# +dMj8p4Z4A2UKKDr2xpRoJWCjihrpM6ddt6pc6pIallDrl/q+A8GQp3fBmiW/iqg
# dFtjZt5rLLh4qk1wbfAs8QcVfjW05rUMopml1xVrNQ6F1uAszOAMJLh8UgsemXzv
# yMjFjFhpr6s94c/MfRWuFL+Kcd/Kl7HYR+ocheBFThIcFClYzG/Tf8u+wQ5KbyCc
# rtlzMlkI5y2SoRoR/jKYpl0rl+CL05zMbbUNrkdjOEcXW28T2moQbh9Jt0RbtAgK
# h1pZBHYRoad3AhMcMYIE9DCCBPACAQEwLzAbMRkwFwYDVQQDDBBBVEEgQXV0aGVu
# dGljb2RlAhB4Rqz84StDtEkAvS/jG4RlMAkGBSsOAwIaBQCgeDAYBgorBgEEAYI3
# AgEMMQowCKACgAChAoAAMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3AgEEMBwGCisG
# AQQBgjcCAQsxDjAMBgorBgEEAYI3AgEVMCMGCSqGSIb3DQEJBDEWBBTa7StZbwPR
# JU6Oe7aScCqCmAAo4jANBgkqhkiG9w0BAQEFAASCAQBltwaZfdthC58jGFLAxYTw
# VoSQ46JCwV9/MdWz9yUOQgDs8nb2ZGn3kGMsht5SEpTlA4bRayG/0ciLANFsASDY
# Lx4uZgO7ETohk+BNXBjkSZalbLG+ngAWSdquZMcBXb8J0MjHr2WGzNNOz3zlZA/S
# EJ27IysbG+sReDovYA7UkTJRdgyPpUpctsxLA+6ZS8/1ppJzBk/EEk1cqE0CYdcR
# f3SmhTTV+epyh0RMd43ee7rqbzD+INPqSwBGd+vD7cf0HW0J95b52w6Sz5bHlKV9
# pBiX2PzQcEOAuJHXDDwMvciIalnyI0OPVyNYySTPf1TUgmJNOfHCdLE7W1AehNhn
# oYIDIDCCAxwGCSqGSIb3DQEJBjGCAw0wggMJAgEBMHcwYzELMAkGA1UEBhMCVVMx
# FzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMTswOQYDVQQDEzJEaWdpQ2VydCBUcnVz
# dGVkIEc0IFJTQTQwOTYgU0hBMjU2IFRpbWVTdGFtcGluZyBDQQIQCnpKiJ7JmUKQ
# BmM4TYaXnTANBglghkgBZQMEAgEFAKBpMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0B
# BwEwHAYJKoZIhvcNAQkFMQ8XDTIyMDQyMTA2MTczM1owLwYJKoZIhvcNAQkEMSIE
# IC2U1js2M6cFhDEZAEJ8DrGUDCZkB+GV+omMAY9CYWrKMA0GCSqGSIb3DQEBAQUA
# BIICADqkRYf1rT5BbKcHX7FSlM6XtYRr9IXaqK2bhcw3g3b0Nx+rFUC4eo+mEZjZ
# XHH4wOJbvsI69v4Lek9qWqXjHK93cIStxS7m04V/+AR6GSeu0hBuF8gAA7KefZLK
# EKpAdHTNI4+HskGz9JJTMgVCPEpbxrUCucmqs9uP9KvEQy3UFN1Ay1Ytb6mw4S/1
# 2u/6Omzyfc55+Ggcy+bzZHl2rsU7kCJyyMSLb7uImtbb5f3F64PwsU1wnvGyWBcR
# zL2f18n9rby4ytiYC877Heeyh0D8dTNwvbG+JHbf1uVxzMbITwCYoJyermCFJmVR
# DIFUUGgQ49MHIqtknf7Qtjm3s0qOX5/4UWjBn10wdcChZXuZuyoEN2FE2ZJt9+59
# 3zJQ0mQ+P2kXgR6SZQRra2+T4pRUmMuUjYf6wCuP2zGdzRAo9WLoJ+f5WOPJZfLa
# OPwJVfI98TOJKbQCE7fzFWDPrh2NHwNgtzkoytnNZy2DPDxiUsPpo9GcP/5xj169
# zOOIT37F6ux/mbwBKeoADaNwmofryuY/NC5OlKI9lFFdWJt3O+U1rCxTHq4Sskm0
# Y0qTNgDrA+5NUedmUCvbaYzWVepTAwM4KpJg2XOR+MliOQBGbvyG0zjQpTdUXiQ6
# 96lfpMm7w8EBo+y2MCXltmcy1ztZtxMr7obKT8tdrrQd0iNc
# SIG # End signature block
