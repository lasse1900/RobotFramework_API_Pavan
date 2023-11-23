*** Settings ***
Library     RequestsLibrary
Library     Collections
 
 
*** Variables ***
${base_url}         https://reqres.in/api/users
${updated_expectedname}     update_test
${updated_expectedjob}      resident
 
 
*** Test Cases ***
 
Quick PUT Request Test
    &{req_body}=  Create Dictionary    name=update_test        job=resident
    ${response}=     PUT        ${base_url}+/2     json=${req_body}    expected_status=200
    log      ${response.json()}
 
    Dictionary Should Contain Key     ${response.json()}     name
    ${name}=    Get From Dictionary     ${response.json()}    name
    Should Be Equal As Strings    ${updated_expectedname}    ${name}
 
    Dictionary Should Contain Key     ${response.json()}     job
    ${job}=    Get From Dictionary     ${response.json()}    job
    Should Be Equal As Strings    ${updated_expectedjob}    ${job}