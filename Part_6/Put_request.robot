*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${base_url}        http://localhost:3000/students
${id_number}       2
${major}           physics     


*** Test Cases ***
PUT_StudentRegistration
    Create Session        mysession              ${base_url}
    ${body}=              Create Dictionary      id=${id_number}    name=Robert Gibbons    email=rgibbons@gmail.com  you=1989    major=${major} 
    ${header}=            Create Dictionary      Content-Type=application/json
    ${response}=          Put On Session         mysession                      /${id_number}             json=${body} 

    Log To Console        ${response.status_code}
    Log To Console        ${response.content}

    # Validations
    ${code}=              Convert To String      ${response.status_code}
    Should Be Equal       ${code}                200
    ${response2}=         GET On Session         mysession              http://localhost:3000/students/${id_number}
    Log To Console        RESPONSE:---> ${response2.content}
    
