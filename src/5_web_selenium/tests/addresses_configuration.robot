*** Settings ***
Resource    ../resource/my_account/login_rsc.robot
Resource    ../resource/navigation/session_rsc.robot
Resource    ../data_driven/credenciais.robot
Resource    ../resource/my_account/addresses_configuration_rsc.robot

Suite Setup         Abrir Navegador e Fazer login     user=${LOGIN}    password=${PASSWORD}    URL=${URL_BASE}    browser=chrome
Suite Teardown      Logout e Fechar Navegador         url=${URL_BASE}    url_complementar=/my-account/

*** Variables ***

# robot -d ./results -L trace  .\src_projects\ecommerce\tests\addresses_configuration.robot

*** Test Cases ***
Configurar endereço de entrega
    
    Navegar para      url=${URL_BASE}    url_complementar=/my-account/edit-address/
    Alterar Endereço de entrega      street=Teste 123456    city=BH   state=Minas Gerais    postcode=35060-970    country=Brazil    phone=12345678
    Validar Endereço de entrega      street=Teste 123456    city=BH    state=Minas Gerais    postcode=35060-970    country=Brazil

    

