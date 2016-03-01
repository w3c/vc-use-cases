@startuml
' Built at http://plantuml.com/plantuml/
' Modified by @halindrome to harmonize terminology
!includeurl  https://raw.githubusercontent.com/opencreds/website/master/specs/source/common/skin.pml 
Autonumber

Actor "Jane" as Holder
Participant "User Agent" as UA
Participant "Credential Curator" as CS
Participant "Certifying Authority" as Issuer

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
