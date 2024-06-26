*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***


*** Keywords ***
Realizar Checkout
    [Arguments]    ${produto}

    Wait Until Element Is Visible    class:entry-title

    FOR  ${i}  IN  @{produto}
        Element Should Contain        //*[@id="order_review"]/table    ${i}
    END

    Wait Until Element Is Visible    //*[@id="place_order"]
    Mouse Over    //*[@id="place_order"]
    Click Element    //*[@id="place_order"]

    Sleep    5s
    
