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
TC01
    [Tags]    T1    Tag1    Suite1
    Open Browser    https://nokiausa--rmdev2.cs107.my.salesforce.com/    ${Browser}
    Maximize Browser Window
    Wait Until Page Contains Element    //input[@id='username']    30s
    Input Text    //input[@id='username']    test.general04@nokia.com
    Input Text    //input[@id='password']    Money$money4us!
    Click Element    //input[@id='Login']
    Wait Until Element Is Visible    //input[@id='phSearchInput']    30s
    Input Text    //input[@id='phSearchInput']    Licensing contract with Test Master Account
    Wait until page contains    Licensing contract with Test Master Account    30s
    Click Element    //input[@id='phSearchButton']
    Click Element    (//span[contains(text(),'Royalty Management')])[2]//following::a[text()='Licensing contract with Test Master Account'][1]
    Wait Until Page Contains Element    //div[@class='brandTertiaryBrd first pbSubheader tertiaryPalette']//following::div[1][@class='pbSubsection']/table[1]/tbody/tr    20s
    ${rowcount}=    Get Element Count    //div[@class='brandTertiaryBrd first pbSubheader tertiaryPalette']//following::div[1][@class='pbSubsection']/table[1]/tbody/tr
    Set Test Variable    ${rowcount}    ${rowcount}
    Log    ${rowcount}
    ${rowcount}=    Evaluate    ${rowcount}+1
    @{MyList}    Create List
    Set Test Variable    @{MyList}
    : FOR    ${count}    IN RANGE    1    ${rowcount}
    \    ${INFOLIST}=    Create List
    \    Set Test Variable    ${INFOLIST}
    \    Set Test Variable    ${rowcount}    ${count}
    \    GetdataofParticulaRow    ${rowcount}
    \    Append To List    ${MyList}    ${INFOLIST}
    \    Log    ${MyList}
    Log    ${LicenseeAccount}
    Close Browser

TC03
    [Tags]    T3    Tag3    Suite1
    Open Browser    https://docs.seleniumhq.org/    chrome
    Maximize Browser Window
    Close Browser

TC06
    [Tags]    T7    T8

*** Keywords ***
GetdataofParticulaRow
    [Arguments]    ${rowcount}
    ${colcount}=    Get Element Count    //div[@class='brandTertiaryBrd first pbSubheader tertiaryPalette']//following::div[1][@class='pbSubsection']/table[1]/tbody/tr[1]/td
    : FOR    ${count}    IN RANGE    1    ${colcount}+1
    \    ${value}=    Get Text    //div[@class='brandTertiaryBrd first pbSubheader tertiaryPalette']//following::div[1][@class='pbSubsection']/table[1]/tbody/tr[${rowcount}]/td[${count}]
    \    ${value1}=    Run Keyword If    '${count}'!='${colcount}'    Get Text    //div[@class='brandTertiaryBrd first pbSubheader tertiaryPalette']//following::div[1][@class='pbSubsection']/table[1]/tbody/tr[${rowcount}]/td[${count+1}]
    \    Run Keyword If    '${value}'=='Licensee Account'    Set Test Variable    ${LicenseeAccount}    ${value1}
    \    Run Keyword If    '${value}'=='Contract ID'    Set Test Variable    ${ContractId}    ${value1}
    \    Log    ${LicenseeAccount}
    \    Insert Into List    ${INFOLIST}    ${count}    ${value}
    \    Log    ${INFOLIST}
