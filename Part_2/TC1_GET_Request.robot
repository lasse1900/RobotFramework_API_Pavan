*** Settings ***
Library    RequestsLibrary
Library    Collections

# https://apipheny.io/free-api/#apis-without-key

*** Variables ***
${base_url}        https://api.zippopotam.us/us
${country}         Finland
${zip_code}        33160

*** Test Cases ***
TC_001_Get_Request
    Create Session        My_session                ${base_url}
    # Get Request is Depcerated    
    # ${response}=        Get Request               My_session    ${zip_code}
    # expected_status     200 / 201 / 404 / any
    ${response}=          GET On Session             My_session    ${zip_code}    expected_status=any

    # Log To Console    ${response.status_code}
    # Log to Console    ${response.content}
    # Log To Console    "\n\n"
    # Log To Console    ${response.headers}

    # Validations
    ${status_code}=        convert to string     ${response.status_code}
    Should Be Equal        ${status_code}        200

    ${body}=                Convert To String    ${response.content}
    Should Contain         ${body}    33160

    ${contentTypeValue}=   get from dictionary    ${response.headers}   Content-Type
    Should Be Equal        ${contentTypeValue}    application/json

