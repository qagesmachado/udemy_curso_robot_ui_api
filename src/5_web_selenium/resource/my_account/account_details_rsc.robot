*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Alterar detalhes da conta
    [Arguments]     ${first_name}    ${last_name}    ${display_name}
        
    Input Text    id:account_first_name       ${first_name}
    Input Text    id:account_last_name        ${last_name}
    Input Text    id:account_display_name     ${display_name}

    Click Button    //*[@id="post-9"]//button[@name='save_account_details']    

Validar detalhes da conta no Dashboard
    [Arguments]     ${display_name}
    
    Wait Until Element Is Visible    class:woocommerce-MyAccount-content

    # Capturando texto na página WEB
    ${texto_dashboard}=                         Get WebElement          class:woocommerce-MyAccount-content
    Log To Console    ${texto_dashboard}
    Log To Console    ${texto_dashboard.text}
    
    # Validação
    Should Contain    ${texto_dashboard.text}    ${display_name}

Validar erro ao configurar detalhes conta

    Wait Until Element Is Visible    class:woocommerce-error

    # Capturando texto na página WEB
    ${texto_erro}=                         Get WebElement          class:woocommerce-error
    Log To Console    ${texto_erro.text}
    
    # Validação
    @{lista_opcoes}    Create List        First name is a required field    Last name is a required field      Display name is a required field  
    Should Contain Any    ${texto_erro.text}    @{lista_opcoes}