*** Settings ***
Library    RequestsLibrary


*** Variables ***
${base_url}        http://localhost:3000/students 

*** Test Cases ***
TC_001_Get_Request
    Create Session        My_session                ${base_url}
    ${response}=          GET On Session            My_session    /     expected_status=any    

    # Validations
    ${code}=              Convert To String         ${response.status_code}
    Should Be Equal       ${code}                   200
    Log To Console        ${response.status_code}
    Log To Console        ${response.content}