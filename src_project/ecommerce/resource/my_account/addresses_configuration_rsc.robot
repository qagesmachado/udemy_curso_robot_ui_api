*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Alterar Endereço de entrega
    [Arguments]     ${street}    ${city}    ${state}    ${postcode}    ${country}    ${phone}
    
    Click Element    //*[@id="post-9"]//div[@class='u-column1 col-1 woocommerce-Address']//a

    Select From List By Label    id:billing_country    ${country}
    Input Text    id:billing_address_1    ${street}
    Input Text    id:billing_city         ${city}

    Click Element    id:select2-billing_state-container
    Input Text    //input[@class='select2-search__field']    ${state}
    Press Keys    //input[@class='select2-search__field']    ENTER

    Input Text    id:billing_postcode         ${postcode}
    Input Text    id:billing_phone         ${phone}
    
    Click Button    //*[@id="post-9"]//button[@name='save_address']

Validar Endereço de entrega
    [Arguments]     ${street}    ${city}    ${state}    ${postcode}    ${country}
    
    # Validação mensagem de sucesso
    Wait Until Element Is Visible    class:woocommerce-message
    ${texto_dashboard}=                         Get WebElement          class:woocommerce-message
    Should Contain    ${texto_dashboard.text}    Address changed successfully.
    
    # Validação endereço alterado
    Wait Until Element Is Visible    //*[@id="post-9"]//div[@class='u-column1 col-1 woocommerce-Address']//address
    ${texto_dashboard}=                         Get WebElement          //*[@id="post-9"]//div[@class='u-column1 col-1 woocommerce-Address']//address
    Should Contain    ${texto_dashboard.text}    ${street}
    Should Contain    ${texto_dashboard.text}    ${city}
    Should Contain    ${texto_dashboard.text}    ${state}
    Should Contain    ${texto_dashboard.text}    ${postcode}
    Should Contain    ${texto_dashboard.text}    ${country}

