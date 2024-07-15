*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***


*** Keywords ***
Validar Carrinho
    [Arguments]    ${produto}    ${quantidade}    ${valor}
    
    ${table}    Get WebElement    //*[@class="shop_table shop_table_responsive cart woocommerce-cart-form__contents"]
    # Log To Console     ${table.text}

    ${count}    Get Element Count    //*[@class="shop_table shop_table_responsive cart woocommerce-cart-form__contents"]/tbody/tr
    # Log To Console    ${count}
    FOR  ${i}  IN RANGE  ${count}
        ${j}    Evaluate     ${i}+1
        # Log To Console     ${j}
        
        ${row}    Get WebElement    //*[@class="shop_table shop_table_responsive cart woocommerce-cart-form__contents"]/tbody/tr[${j}]
        ${resposta}    Run Keyword And Return Status    Should Contain   ${row.text}    ${produto}
        # Log To Console    ${resposta}
        
        IF  '${resposta}' == 'True'
            ${tb_product}    Get WebElement    //*[@class="shop_table shop_table_responsive cart woocommerce-cart-form__contents"]/tbody/tr[${j}]/td[3]
            ${tb_price}    Get WebElement    //*[@class="shop_table shop_table_responsive cart woocommerce-cart-form__contents"]/tbody/tr[${j}]/td[4]
            ${tb_subtotal}    Get WebElement    //*[@class="shop_table shop_table_responsive cart woocommerce-cart-form__contents"]/tbody/tr[${j}]/td[6]

            Should Be Equal    ${tb_product.text}    ${produto}

            ${calculado}    Evaluate    ${quantidade}*${valor}
            ${calculado}    Convert To Number    ${calculado}    precision=2

            ${tb_subtotal}    Strip String   ${tb_subtotal.text}    characters=$ 
            ${tb_subtotal}    Convert To Number    ${tb_subtotal}    precision=2

            Should Be Equal        ${tb_subtotal}    ${calculado}

            Log To Console       ${tb_product.text} - ${tb_price.text} - ${tb_subtotal} - ${calculado}
        END
        
    END
       
Limpar Carrinho
        
    ${resposta}    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@class="shop_table shop_table_responsive cart woocommerce-cart-form__contents"]
    Log To Console    ${resposta}

    IF  '${resposta}' == 'True'
        
        # ${table}    Get WebElement    //*[@class="shop_table shop_table_responsive cart woocommerce-cart-form__contents"]
        # Log To Console     ${table.text}

        ${count}    Get Element Count    //*[@class="shop_table shop_table_responsive cart woocommerce-cart-form__contents"]/tbody/tr
        Log To Console    ${count}
        FOR  ${i}  IN RANGE  ${count}
            # ${j}    Evaluate     ${i}+1
            
            Click Element    //*[@class="shop_table shop_table_responsive cart woocommerce-cart-form__contents"]/tbody/tr[1]/td[1]/a[@class='remove']
            Sleep     3s

            ${resposta}    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@class="shop_table shop_table_responsive cart woocommerce-cart-form__contents"]
            Log To Console    ${resposta}
            Exit For Loop If    '${resposta}' == 'False'    
        END   
    END

    Log To Console    Carrinho esta limpo
    
    
    