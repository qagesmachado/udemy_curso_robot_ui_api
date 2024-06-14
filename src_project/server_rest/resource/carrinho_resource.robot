*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Library    String

*** Variables ***


*** Keywords ***
Cadastrar Produto no Carrinho
    [Arguments]    ${product_id}    ${produto}    ${token}        ${expected_result}

    # Getting the file
    ${body}    Get File    path=${EXECDIR}/src_projects/server_rest/data_driven/produtos_carrinho_template.json
    ${body}    Replace String Using Regexp    ${body}    _product_id       ${product_id}
    ${body}    Replace String Using Regexp    ${body}    "_quantidade"       ${produto}[quantidade]
    
    Log To Console   ${body} 

    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${token}

    ${RESPONSE}    POST On Session    alias=api    url=/carrinhos    headers=${header}    data=${body}   expected_status=${expected_result}
    Log To Console    ${RESPONSE.json()}
    Log To Console    ${RESPONSE.json()['_id']}

    ${carrinho_id}    Set Variable    ${RESPONSE.json()['_id']}

    [Return]    ${carrinho_id}

Buscar Carrinho
    [Arguments]    ${carrinho_id}    ${produto}    ${expected_status}    ${token}

    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${token}

    ${Response}    GET On Session    alias=api    headers=${header}    url=/carrinhos/${carrinho_id}    expected_status=${expected_status}
    Log To Console    ${Response.json()}

    IF   ${expected_status} == 200
        # Validações
        ${preco}    Set Variable    ${produto}[preco]
        ${preco_total}    Set Variable    ${Response.json()['precoTotal']}
        ${qtd}    Set Variable    ${Response.json()['quantidadeTotal']}

        ${preco}    Convert To Number    ${preco}
        ${preco_total}    Convert To Number    ${preco_total}
        ${qtd}    Convert To Number    ${qtd}
        
        ${preco_total_calculado}     Evaluate     ${preco}*${qtd}
        
        Should Be Equal    ${preco_total_calculado}    ${preco_total}       
    END
     

Realizar Compra
    [Arguments]    ${token}    ${expected_status}

    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${token}

    ${Response}    DELETE On Session    alias=api    headers=${header}    url=/carrinhos/concluir-compra/    expected_status=${expected_status}
    Log To Console    ${Response.json()}

Excluir Carrinho / Cancelar Compra
    [Arguments]    ${token}    ${expected_status}

    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${token}

    ${Response}    DELETE On Session    alias=api    headers=${header}    url=/carrinhos/cancelar-compra/    expected_status=${expected_status}
    Log To Console    ${Response.json()}
