*** Settings ***
Library    SeleniumLibrary
Resource    ../my_account/login_rsc.robot


*** Variables ***


*** Keywords ***
Abrir navegador
    [Arguments]    ${URL}    ${browser}=chrome
    Open Browser    url=${URL}    browser=${browser}    options=add_experimental_option("detach", True)

Fechar Navegador
    Close Browser

Navegar para
    [Arguments]    ${url}    ${url_complementar}

    Go To    ${url}${url_complementar}

Abrir Navegador e Fazer login
    [Arguments]    ${user}    ${password}    ${URL}    ${browser}
    Abrir navegador    ${URL}    ${browser}
    Navegar para    ${URL}    /my-account
    Realizar Login    ${user}    ${password}

Logout e Fechar Navegador
    [Arguments]    ${url}    ${url_complementar}
    Navegar para    ${url}    ${url_complementar}
    Realizar Logout
    Close Browser
