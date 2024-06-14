*** Settings ***

*** Variables ***
# robot -d ./results -L trace  .\src\2_builtin\2_10_run_ky.robot
${var}  2
*** Test Cases ***

Teste - Run Keyword 

    Run Keyword  keyword_1  

Teste - Run failure
    Run Keyword And Continue On Failure    keyword_2
    
    Log To Console    Esta linha sera executada

Teste - Run keyword concidional
    Run Keyword If    ${var}>4    keyword_3
    ...               ELSE        keyword_4   

Teste para retornar status    
    ${passed}    Run Keyword And Return Status    keyword_5
    Run Keyword If   not ${passed}    Fatal Error

Teste
    Log To Console     Este é um teste

*** Keywords ***
keyword_1
    Log To Console    Esta é a keyword 1
 
keyword_2
    Log To Console    Esta é a keyword 2
    Fail
    Log To Console    nao será executado

keyword_3
    Log To Console    Esta é a keyword 3

keyword_4
    Log To Console    Esta é a keyword 4
keyword_5
    Fail
