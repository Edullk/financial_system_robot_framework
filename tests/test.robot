*** Settings ***
Library   Browser

*** Variables ***
${date} =	Get Current Date

*** Test Cases **

Verifica abertura da página
    New Page              http://localhost:3000/
    Get Text              h1    contains    Sistema Financeiro           
    Get Element States    id=month_area    contains    visible
    Get Element States    id=input_area    contains    visible
    Get Element States    id=table_area    contains    visible


Verifica scroll de meses
    New Page                    http://localhost:3000/
    ${current_month_title}=     Get Text                    id=mount_title 
    Click                       id=arrow_rigth
    ${new_month_title}=         Get Text                    id=mount_title 
    Should Not Be Equal         ${current_month_title}      ${new_month_title}
    Click                       id=arrow_left
    ${new_month_title}=         Get Text                    id=mount_title
    Should Be Equal             ${current_month_title}      ${new_month_title}

Seleciona data
    New Page    http://localhost:3000/
    Click       id=date_input


    

