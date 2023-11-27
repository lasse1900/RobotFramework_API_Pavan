*** Settings ***
Library     RequestsLibrary
Library     Collections
Library    ../virtual/Lib/site-packages/robot/libraries/String.py
 
 
*** Variables ***
${base_url}         http://localhost:3000/students/ 
${expectedname}     ${name}
${expectedjob}      ${major}
${name}             Stefanie Paglieri
${email}            spablieri@gmail.com
${yob}              1989
${major}            chemistry
 
 
*** Test Cases ***
 
Quick POST Request Test
    ${PO_Number}    Generate Random String    4    0123456789
    Log To Console    Random number: ${PO_Number}
    &{req_body}=  Create Dictionary    id=${PO_Number}      name=${name}        email=${email}    yob=${yob}    major=${major}
    ${response}=     POST        ${base_url}     json=${req_body}    expected_status=201
    log      ${response.json()}

    # Validations
    Dictionary Should Contain Key       ${response.json()}     id
    ${name}=    Get From Dictionary     ${response.json()}    name
    Should Be Equal As Strings          ${expectedname}   ${name}
 
    ${major}=    Get From Dictionary     ${response.json()}    major
    Should Be Equal As Strings           ${expectedjob}    ${major}

