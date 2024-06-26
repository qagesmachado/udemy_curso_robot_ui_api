*** Settings ***
Library   OperatingSystem

*** Variables ***
    # robot -d ./results -L trace  .\src\3_operation_system\3_0_operation_system_test.robot

*** Test Cases ***
Teste de Operation system
    
    Create File    C:/repositories/robot_basic_udemy/src/3_operation_system/teste.txt
    Append To File    C:/repositories/robot_basic_udemy/src/3_operation_system/teste.txt    Teste\n
    Append To File    C:/repositories/robot_basic_udemy/src/3_operation_system/teste.txt    Teste\n

    ${file}    Get File    C:/repositories/robot_basic_udemy/src/3_operation_system/teste.txt
    Log To Console    ${file}

    ${file_2}    Get File    C:/repositories/robot_basic_udemy/src/3_operation_system/teste.json
    Log To Console    ${file_2}

    ${tipo}    Evaluate    type($file_2)

*** Keywords ***


