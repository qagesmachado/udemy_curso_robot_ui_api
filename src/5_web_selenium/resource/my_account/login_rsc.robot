*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Realizar Login
    [Arguments]    ${user}    ${password}   

    Input Text          id:username      ${user}
    Input Password      id:password      ${password}
    Click Button       //*[@id="customer_login"]//button[@name='login']

    Wait Until Page Contains    From your account dashboard you can view your

    
Realizar login incorreto
    [Arguments]    ${user}    ${password}
    Input Text          id:username      ${user}
    Input Password      id:password      ${password}

    Click Button       //*[@id="customer_login"]//button[@name='login']
    
    Wait Until Element Is Visible    class:woocommerce-error
    Wait Until Element Contains    locator=class:woocommerce-error    text=Error

Realizar Logout
    Click Element    //*[@id="post-9"]//li[@class='woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--customer-logout']/a
    Wait Until Element Is Visible    id:username
    Wait Until Element Is Visible    id:password