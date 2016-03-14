@startuml
' Built at http://plantuml.com/plantuml/
' Modified by @halindrome to harmonize terminology
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

Actor "Jane" as Holder
Participant "User Agent" as UA
Participant "Credential Curator" as CS
Participant "Issuer" as Issuer

Holder->UA: Navigate to\nweb site
UA->Issuer: Request Credential
Issuer->Issuer: Verify\nidentity
Issuer->Issuer: Generate credential
Issuer->UA: Issue credential
UA->Holder: Display credential
Holder->UA: Save credential
UA->CS: Store credential
CS->UA: List of credentials
UA->Holder: Show credential list

title Example credential creation flow

@enduml
