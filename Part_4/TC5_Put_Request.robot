*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${base_url}        https://thetestingworldapi.com/api/studentsDetails
${id_number}       8732541                


*** Test Cases ***
PUT_StudentRegistration
    Create Session        mysession              ${base_url}
    ${body}=              Create Dictionary      id=${id_number}    first_name=Samuel              middle_name=Pallojalka5  last_name=Jackson  date_of_birth=10/09/2005
    ${header}=            Create Dictionary      Content-Type=application/json
    ${response}=          Put On Session         mysession                      /${id_number}             json=${body} 

    Log To Console        ${response.status_code}
    Log To Console        ${response.content}

    # Validations
    ${code}=              Convert To String      ${response.status_code}
    Should Be Equal       ${code}                200
    ${response2}=         GET On Session            mysession              https://thetestingworldapi.com/api/studentsDetails/${id_number}
    Log To Console        RESPONSE:---> ${response2.content}
    
