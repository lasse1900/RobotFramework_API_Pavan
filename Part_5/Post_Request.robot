*** Settings ***
Library     RequestsLibrary
Library     Collections
 
 
*** Variables ***
${base_url}         https://reqres.in/api/users
${page_id}          2
${expectedname}     test
${expectedjob}      tester
 
 
*** Test Cases ***
 
Quick POST Request Test
    &{req_body}=  Create Dictionary    name=test        job=tester
    ${response}=     POST        ${base_url}     json=${req_body}    expected_status=201
    log      ${response.json()}
    Dictionary Should Contain Key     ${response.json()}     id
    ${name}=    Get From Dictionary     ${response.json()}    name
    Should Be Equal As Strings    ${expectedname}   ${name}
 
    ${job}=    Get From Dictionary     ${response.json()}    job
    Should Be Equal As Strings    ${expectedjob}    ${job}