*** Settings ***
Resource   ../resource/usuarios_resource.robot
Resource    ../resource/autenticacao_resource.robot
Resource    ../resource/produto_resource.robot
Resource    ../resource/carrinho_resource.robot
Resource   ../resource/session_resource.robot

Suite Setup        Criar Sessão        https://serverest.dev
Suite Teardown     Encerrar Sessão

*** Variables ***
# robot -d ./results -L trace  .\src_projects\server_rest\tests\teste_carrinho.robot
&{produto}     nome=Camiseta do Brasil      preco=100   quantidade=2    descricao=camiseta de selecao
&{USER}    nome=EU QA Teste     email=qa_adm@qa.com.br    password=teste1    administrador=true
*** Test Cases ***

Teste - Fluxo Carrinho completo com 1 Produto
   
    # Setup
    ${USER_ID}    Criação de usuário    ${USER}
    ${token}    Autenticar    ${USER.email}    ${USER.password}    200
    ${product_id}    Criar Produto  ${token}    ${produto}    201
    
    # CARRINHO
    ${carrinho_id}    Cadastrar Produto no Carrinho  ${product_id}    ${produto}    ${token}    201

    Buscar Carrinho    ${carrinho_id}    ${produto}    200    ${token}

    Realizar Compra    ${token}    200
    Buscar Produto    ${token}    ${product_id}    200
            
    Excluir Carrinho / Cancelar Compra    ${token}    200
    Buscar Produto    ${token}    ${product_id}    200

    # CLEAR TEST
    Deletar Produto  ${token}     ${product_id}    200
    Deletar usuário    USER_ID=${USER_ID}    USER=${USER}

