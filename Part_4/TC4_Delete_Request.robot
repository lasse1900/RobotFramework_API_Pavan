*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${base_url}    https://thetestingworldapi.com/
${id}          8729112  


*** Test Cases ***
TC4 Validate Delete Request 
    Create Session        AppAccess    ${base_url}
    ${response}=          Delete Request       AppAccess   api/technicalskills/8728380
    # ${response}=         DELETE On Session    AppAccess   api/technicalskills/${id}
    ${code}=              Convert To String    ${response.status_code}
    Should Be Equal       ${code}              200
    # ${jsonresponse}=      To Json             ${response.content}
    ${resp.json()}=       ${response.content}    
    ${status_list}=       Get Value From Json   ${resp.json()}    status 
    # ${status_list}=       Get Value From Json    ${jsonresponse}    status 
    ${status}=            Get From List         ${status_list}    0 
    Should Be Equal       ${status}             true 


