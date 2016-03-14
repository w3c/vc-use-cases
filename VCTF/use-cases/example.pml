@startuml
' bringing this in from the master branch
!includeurl  https://raw.githubusercontent.com/w3c/webpayments-ig/master/VCTF/common/skin.pml 
!ifndef SKIN_INCLUDED
skinparam {
    backgroundColor transparent
    defaultFontName Lucida Sans
    shadowing false
}
skinparam sequence {
    DividerBackgroundColor transparent
    LifeLineBackgroundColor transparent
}
!endif

Autonumber

Actor Jane
Participant "Credential Curator" as CV
Participant "User Agent" as UA
Participant "Credential Consumer" as merchant

Jane->merchant: Navigate to web site

Note right
    Merchant requires that
    web site users be at
    least 21 years of age
End note

merchant->UA: Request proof of age
UA->CV: Need proof of age
CV->Jane: Displays relevant credentials
Jane->CV: Selects a credential
CV->merchant: Use this credential as proof of age
merchant->merchant: Verify
merchant->UA: Redirect to web site

title Example age verification flow

@enduml
