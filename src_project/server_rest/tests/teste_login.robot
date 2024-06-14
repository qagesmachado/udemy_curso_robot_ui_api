*** Settings ***
Resource   ../resource/usuarios_resource.robot
Resource    ../resource/autenticacao_resource.robot
Resource   ../resource/session_resource.robot

Suite Setup        Criar Sessão        https://serverest.dev
Suite Teardown     Encerrar Sessão

*** Variables ***
# robot -d ./results -L trace  .\src_projects\server_rest\tests\teste_login.robot
${senha_incorreta}    senha_errada
&{USER}    nome=EU QA Teste     email=qa@qa.com.br    password=teste    administrador=true
*** Test Cases ***

Teste - Autenticação com sucesso
   
    # CREATE
    ${USER_ID}    Criação de usuário    ${USER}

    # Autenticação
    ${token}    Autenticar    ${USER.email}    ${USER.password}    200

    Log To Console    Este é um tokne valido -> ${token}

    # Excluir usuário
    Deletar usuário    USER_ID=${USER_ID}     USER=${USER}

Teste - Autenticação sem sucesso
   
    # CREATE
    ${USER_ID}    Criação de usuário    ${USER}

    # Autenticação
    ${token}    Autenticar    ${USER.email}    ${senha_incorreta}    401

    # Excluir usuário
    Deletar usuário    USER_ID=${USER_ID}     USER=${USER}