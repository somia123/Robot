*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC02
    [Tags]    Suite2
    Open Browser    https://elisa.fi/    chrome
    Maximize Browser Window
    Close Browser

TC04
    [Tags]    T4    Tag4    Suite2
    Open Browser    https://www.google.com/    chrome
    Maximize Browser Window
    Close Browser

TC05
    [Tags]    Suite2    T5
    Open Browser    https://www.facebook.com/    chrome
    Maximize Browser Window
    Close Browser
