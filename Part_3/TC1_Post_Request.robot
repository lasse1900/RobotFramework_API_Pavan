*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${base_url}        https://thetestingworldapi.com/api/studentsDetails


*** Test Cases ***
PUT_StudentRegistration
    Create Session    mysession    ${base_url}
    ${body}=        Create Dictionary    first_name=Kalle  middle_name=Olli  last_name=Ojala  date_of_birth=12/09/2001
    ${header}=      Create Dictionary    Content-Type=application/json
    # Post Request is deprecated
    # ${response}=    Post Request    mysession    /    data=${body}    headers=${header}
    ${response}=    Post On Session    mysession    /    json=${body} 

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    # Validations
    ${code}=              Convert To String      ${response.status_code}
    Should Be Equal       ${code}    201


