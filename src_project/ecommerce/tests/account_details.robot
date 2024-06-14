*** Settings ***
Resource    ../resource/my_account/login_rsc.robot
Resource    ../resource/navigation/session_rsc.robot
Resource    ../data_driven/credenciais.robot
Resource    ../resource/my_account/account_details_rsc.robot

Suite Setup         Abrir Navegador e Fazer login     user=${LOGIN}    password=${PASSWORD}    URL=${URL_BASE}    browser=chrome
Suite Teardown      Logout e Fechar Navegador         url=${URL_BASE}    url_complementar=/my-account/

*** Variables ***

# robot -d ./results -L trace  .\src_projects\ecommerce\tests\account_details.robot

*** Test Cases ***
Configurar Detalhes da Conta
    
    Navegar para      url=${URL_BASE}    url_complementar=/my-account/edit-account/
    Alterar detalhes da conta    Gustavo    Machado    Gustavo Machado
    Validar detalhes da conta no Dashboard        Gustavo Machado

Configura incorreta os detalhes

    Navegar para      url=${URL_BASE}    url_complementar=/my-account/edit-account/
    Alterar detalhes da conta    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Validar erro ao configurar detalhes conta

    

