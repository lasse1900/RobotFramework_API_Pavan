*** Settings ***
Library     RequestsLibrary
 
 
*** Variables ***
${base_url}         https://reqres.in/api/users
 
 
*** Test Cases ***
 
Quick DELETE Request Test
     ${delete_resp}=   DELETE    ${base_url}+/2           expected_status=204
