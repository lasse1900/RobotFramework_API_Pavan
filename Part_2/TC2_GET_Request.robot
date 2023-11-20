*** Settings ***
Library    RequestsLibrary


*** Variables ***
${base_url}        http://thetestingworldapi.com/api/
${students}        studentsDetails

*** Test Cases ***
TC_001_Get_Request
    Create Session        My_session                ${base_url}
    # Get Request is Depcerated
    # ${response}=          Get Request               My_session    ${students}  
    # expected_status     200 / 201 / 404 / any
    ${response}=          GET On Session             My_session    ${students}      expected_status=any    

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}


