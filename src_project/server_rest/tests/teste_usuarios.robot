*** Settings ***
Resource   ../resource/usuarios_resource.robot
Resource   ../resource/session_resource.robot

Suite Setup        Criar Sessão        https://serverest.dev
Suite Teardown     Encerrar Sessão

*** Variables ***

# robot -d ./results -L trace  .\src_projects\server_rest\tests\teste_usuarios.robot
&{USER_CRUD}    nome=EU QA Teste     email=qa@qa.com.br    password=teste    administrador=true
&{USER_CRUD_2}    nome=EU QA Teste 2     email=qa@qa.com.br    password=teste    administrador=true
*** Test Cases ***

Teste - CRUD
   
    # CREATE
    ${USER_ID}    Criação de usuário    ${USER_CRUD}

    # READ
    Buscar usuário    USER_ID=${USER_ID}    expected_status=200    USER=${USER_CRUD}

    # UPDATE
    Atualizar usuário  USER_ID=${USER_ID}    USER=${USER_CRUD_2}
    Buscar usuário    USER_ID=${USER_ID}   expected_status=200     USER=${USER_CRUD_2}    # Mostra que houve alteração

    # DELETE
    Deletar usuário    USER_ID=${USER_ID}    USER=${USER_CRUD_2}
