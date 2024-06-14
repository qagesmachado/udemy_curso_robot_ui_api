*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Selecionar Produto
    [Arguments]    ${produto}    ${quantidade}    ${valor}
    
    ${produto_get}    Get WebElement    //*[@class="product_title entry-title"]
    Should Contain     ${produto_get.text}   ${produto}

    Input Text    //*[@class="input-text qty text"]    ${quantidade}
    Click Element    //*[@class="single_add_to_cart_button button alt"]

    Wait Until Element Is Visible    class:woocommerce-message
    ${message_get}    Get WebElement    class:woocommerce-message
    Should Contain Any     ${message_get.text}    has been added to your cart    have been added to your cart

