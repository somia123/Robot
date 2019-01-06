*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           BuiltIn

*** Variables ***
${rowcount}       ${EMPTY}
${INFOLIST}       ${EMPTY}
${LicenseeAccount}    ${EMPTY}
${ContractId}     ${EMPTY}
${Browser}    chrome

*** Test Cases ***
TC03
    [Tags]    T3    Tag3    Suite1
    Open Browser    https://docs.seleniumhq.org/    chrome
    Maximize Browser Window
    Close Browser

TC06
    [Tags]    T7    T8

