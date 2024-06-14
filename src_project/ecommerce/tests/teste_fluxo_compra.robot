*** Settings ***
Resource    ../resource/my_account/login_rsc.robot
Resource    ../resource/navigation/session_rsc.robot
Resource    ../data_driven/credenciais.robot
Resource    ../resource/home/home_rsc.robot
Resource    ../resource/product/product_rsc.robot
Resource    ../resource/product/cart_rsc.robot
Resource    ../resource/product/checkout_rsc.robot


Suite Setup         Abrir Navegador e Fazer login     user=${LOGIN}    password=${PASSWORD}    URL=${URL_BASE}    browser=chrome
# Suite Teardown      Logout e Fechar Navegador         url=${URL_BASE}    url_complementar=/my-account/

*** Variables ***

# robot -d ./results -L trace  .\src_projects\ecommerce\tests\teste_fluxo_compra.robot
@{lista_produto}        Album        Beanie with Logo

*** Test Cases ***
Testar fluxo de compra
    
    # Adicionar Produtos
    Navegar para      url=${URL_BASE}    url_complementar=/

    Procurar Produto    Album
    Selecionar Produto    Album    2    15

    Procurar Produto    Beanie with Logo
    Selecionar Produto    Beanie with Logo    2    18

    # Validar Produtos
    Navegar para      url=${URL_BASE}    url_complementar=/cart
    Validar Carrinho    Album    2    15
    Validar Carrinho    Beanie with Logo    2    18

    # Checkout
    Navegar para    url=${URL_BASE}    url_complementar=/checkout
    Realizar Checkout    ${lista_produto}
    
    # Limpar Carrinho
    Navegar para      url=${URL_BASE}    url_complementar=/cart
    Limpar Carrinho

    





    

