*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${base_url}    https://thetestingworldapi.com/
${id}          8732554  


*** Test Cases ***
TC4 Validate Delete Request 
    Create Session        AppAccess    ${base_url}
    ${response}=          DELETE On Session    AppAccess   api/technicalskills/${id}
    ${code}=              Convert To String    ${response.status_code}
    Should Be Equal       ${code}              200
    ${status_list}=       Get Value From Json   ${response.json()}    status 
    Log To Console        Response -> ${status_list}
    # ${status_list}=       Get Value From Json    ${jsonresponse}    status 
    ${status}=            Get From List         ${status_list}    0 
    Should Be Equal       ${status}             true 


