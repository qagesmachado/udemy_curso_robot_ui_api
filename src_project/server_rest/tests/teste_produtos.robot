*** Settings ***
Resource   ../resource/usuarios_resource.robot
Resource    ../resource/autenticacao_resource.robot
Resource    ../resource/produto_resource.robot
Resource   ../resource/session_resource.robot

Suite Setup        Criar Sessão        https://serverest.dev
Suite Teardown     Encerrar Sessão

*** Variables ***
# robot -d ./results -L trace  .\src_projects\server_rest\tests\teste_produtos.robot
&{produto_1}     nome=Camiseta do Brasil      preco=100   quantidade=2    descricao=camiseta de selecao
&{produto_2}     nome=Camiseta da Argentina      preco=90   quantidade=3    descricao=camiseta de selecao
${login}    qa@qa.com.br
${senha}    teste
&{USER_ADM}    nome=EU QA Teste 1     email=qa_adm@qa.com.br    password=teste1    administrador=true
&{USER_ADM_FALSE}    nome=EU QA Teste 2     email=qa@qa.com.br    password=teste2    administrador=false
*** Test Cases ***

Teste - Criação de Produto da maneira 1
   
    # CREATE
    ${USER_ID}    Criação de usuário    ${USER_ADM}

    # Autenticação
    ${token}    Autenticar    ${USER_ADM.email}    ${USER_ADM.password}    200

    Log To Console    Este é um token valido -> ${token}

    # CRUD Produto
    ${product_id}    Criar Produto - old  ${token}    produto_1    201
    
    Buscar Produto    ${token}    ${product_id}    200

    Atualizar Produto - old    ${token}  ${product_id}  produto_2
    Buscar Produto    ${token}    ${product_id}    200

    Deletar Produto  ${token}     ${product_id}    200

    # Excluir usuário
    Deletar usuário    USER_ID=${USER_ID}    USER=${USER_ADM}

Teste - Criação de Produto da maneira 2
   
    # CREATE
    ${USER_ID}    Criação de usuário    ${USER_ADM}

    # Autenticação
    ${token}    Autenticar    ${USER_ADM.email}    ${USER_ADM.password}    200

    # Log To Console    Este é um token valido -> ${token}

    # CRUD Produto
    ${product_id}    Criar Produto  ${token}    ${produto_1}    201
    
    Buscar Produto    ${token}    ${product_id}    200

    Atualizar Produto     ${token}  ${product_id}  ${produto_2}
    Buscar Produto    ${token}    ${product_id}    200

    Deletar Produto  ${token}     ${product_id}    200

    # Excluir usuário
    Deletar usuário    USER_ID=${USER_ID}    USER=${USER_ADM}

Excluir Produto com USER não ADM
    # Creating users
    ${USER_ID_ADM}    Criação de usuário    ${USER_ADM}
    ${USER_ID}    Criação de usuário    ${USER_ADM_FALSE}

    # Autenticação
    ${token_adm}    Autenticar    ${USER_ADM.email}    ${USER_ADM.password}    200

    # Criar produto
    ${product_id}    Criar Produto  ${token_adm}    ${produto_1}    201
    Buscar Produto    ${token_adm}    ${product_id}    200
    
    # Autenticar com usuário não adm e tentar excluir produto
    ${token_no_adm}    Autenticar    ${USER_ADM_FALSE.email}    ${USER_ADM_FALSE.password}    200
    Deletar Produto  ${token_no_adm}     ${product_id}    403
    
    # Autenticação novamente com usuário adm
    ${token_adm}    Autenticar    ${USER_ADM.email}    ${USER_ADM.password}    200
    Deletar Produto  ${token_adm}     ${product_id}    200

    # Excluir usuário
    Deletar usuário    USER_ID=${USER_ID}    USER=${USER_ADM} 
    Deletar usuário    USER_ID=${USER_ID_ADM}    USER=${USER_ADM_FALSE}