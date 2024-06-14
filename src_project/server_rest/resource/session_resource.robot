*** Settings ***
Library    RequestsLibrary

*** Variables ***


*** Keywords ***
Criar Sessão
    [Arguments]    ${url_environment}
    Create Session    alias=api        url=${url_environment}    verify=True

Encerrar Sessão
    Delete All Sessions


