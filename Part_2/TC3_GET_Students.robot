*** Settings ***
Library    RequestsLibrary


*** Variables ***
${Base_URL}        http://thetestingworldapi.com/
${StudentID}       8731322
# https://thetestingworldapi.com/api/studentsDetails (look example ID from here)

*** Test Cases ***
TC_001_Fetch_Student_details_by_id
    Create Session        FetchData                ${Base_URL}
    # ${response}=          Get Request               FetchData         api/studentsDetails/${StudentID} 
    ${response}=          GET On Session            FetchData     api/studentsDetails/${StudentID}      expected_status=any    

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    ${status_code}=   convert to string     ${response.status_code}
    Should Be Equal   ${status_code}        200