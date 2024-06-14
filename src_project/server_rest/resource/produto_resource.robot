*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Library    String

*** Variables ***


*** Keywords ***
Criar Produto - old 
    [Arguments]    ${token}    ${file}    ${expected_result}

    # Getting the file
    IF  "${file}" == "produto_1"
        Log To Console    ${EXECDIR}
        ${body}    Get File    path=${EXECDIR}/src_projects/server_rest/data_driven/produto_1.json
        Log To Console  ${body}
    ELSE IF  "${file}" == "produto_2"
        Log To Console    ${EXECDIR}
        ${body}    Get File    path=${EXECDIR}/src_projects/server_rest/data_driven/produto_2.json
        Log To Console  ${body}
    END
    
    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${token}

    ${RESPONSE}    POST On Session    alias=api    url=/produtos    headers=${header}    data=${body}   expected_status=${expected_result}
    Log To Console    ${RESPONSE.json()}
    Log To Console    ${RESPONSE.json()['_id']}

    ${product_id}    Set Variable    ${RESPONSE.json()['_id']}

    [Return]    ${product_id}

Atualizar Produto - old
    [Arguments]    ${auth_token}    ${product_id}    ${file}
    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${auth_token}

    # Getting the file
    IF  "${file}" == "produto_1"
        Log To Console    ${EXECDIR}
        ${body}    Get File    path=${EXECDIR}/src_projects/server_rest/data_driven/produto_1.json
        Log To Console  ${body}
    ELSE IF  "${file}" == "produto_2"
        Log To Console    ${EXECDIR}
        ${body}    Get File    path=${EXECDIR}/src_projects/server_rest/data_driven/produto_2.json
        Log To Console  ${body}
    END


    ${RESPONSE}    PUT On Session    alias=api    url=/produtos/${product_id}  headers=${header}   data=${body}  expected_status=200
    ${retorno_put}    Set Variable    ${RESPONSE.json()}
    Log To Console    ${retorno_put}

Criar Produto
    [Arguments]    ${token}    ${file}    ${expected_result}
    
    # Getting the file
    ${body}    Get File    path=${EXECDIR}/src_projects/server_rest/data_driven/produto_template.json
    ${body}    Replace String Using Regexp    ${body}    _nome       ${file}[nome]
    ${body}    Replace String Using Regexp    ${body}    "_preco"       ${file}[preco]
    ${body}    Replace String Using Regexp    ${body}    "_quantidade"       ${file}[quantidade]
    ${body}    Replace String Using Regexp    ${body}    _descricao       ${file}[descricao]
    
    Log To Console   ${body} 

    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${token}

    ${RESPONSE}    POST On Session    alias=api    url=/produtos    headers=${header}    data=${body}   expected_status=${expected_result}
    Log To Console    ${RESPONSE.json()}
    Log To Console    ${RESPONSE.json()['_id']}

    ${product_id}    Set Variable    ${RESPONSE.json()['_id']}

    [Return]    ${product_id}

Buscar Produto
    [Arguments]    ${auth_token}    ${product_id}    ${expected_status}

    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${auth_token}

    ${Response}    GET On Session    alias=api    headers=${header}    url=/produtos/${product_id}    expected_status=${expected_status}
    Log To Console    ${Response.json()} 


Atualizar Produto
    [Arguments]    ${auth_token}    ${product_id}    ${file}
    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${auth_token}

    # Getting the file
    ${body}    Get File    path=${EXECDIR}/src_projects/server_rest/data_driven/produto_template.json
    ${body}    Replace String Using Regexp    ${body}    _nome       ${file}[nome]
    ${body}    Replace String Using Regexp    ${body}    "_preco"       ${file}[preco]
    ${body}    Replace String Using Regexp    ${body}    "_quantidade"       ${file}[quantidade]
    ${body}    Replace String Using Regexp    ${body}    _descricao       ${file}[descricao]

    Log To Console   ${body} 

    ${RESPONSE}    PUT On Session    alias=api    url=/produtos/${product_id}  headers=${header}   data=${body}  expected_status=200
    ${retorno_put}    Set Variable    ${RESPONSE.json()}
    Log To Console    ${retorno_put}


Deletar Produto
    [Arguments]    ${auth_token}    ${product_id}    ${expected_status}

    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${auth_token}

    ${Response}    DELETE On Session    alias=api    headers=${header}    url=/produtos/${product_id}    expected_status=${expected_status}
    Log To Console    ${Response.json()}
    
    # Validação não existe usuário
    IF  ${expected_status} == 200
        Buscar Produto    ${auth_token}    ${product_id}    400
    END
    
    

    

    

    

