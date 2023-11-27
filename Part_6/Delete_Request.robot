*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
 
 
*** Variables ***
${base_url}         http://localhost:3000/students
${id}               0506
 
 
*** Test Cases ***
 
Quick DELETE Request Test
     ${response}=   DELETE    ${base_url}/${id}         expected_status=200

     ${status_list}=       Get Value From Json   ${response.json()}    status 
     ${code}=              Convert To String    ${response.status_code}

     # Validations
     Log To Console        ${code}
     Should Be Equal       ${code}              200