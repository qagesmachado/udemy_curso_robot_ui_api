*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN}        teste@testeudemy.com.br
${PASSWORD}     Teste123!@#
${URL_BASE}     http://demostore.supersqa.com

*** Test Cases ***
CT 1 - Login
    Open Browser    url=http://demostore.supersqa.com/my-account/    
    ...             browser=chrome 
    ...             options=add_experimental_option("detach", True)
    
    # Login
    Input Text    //*[@id="username"]    ${LOGIN}
    Input Text    //*[@id="password"]    ${PASSWORD}
    Click Element    //*[@id="customer_login"]//button[@name='login']  
     
    # Navegar home_page
    Go To    ${URL_BASE}/
    
    Input Text    id:woocommerce-product-search-field-0    ${produto}
    Press Keys    id:woocommerce-product-search-field-0    ENTER
