***Settings***
Library    SeleniumLibrary    # Import SeleniumLibrary

***Variables***
${LOGIN_URL}      http://localhost:8080/login   # เปลี่ยนเป็น URL ของหน้า Login 
${BROWSER}        Chrome                        # สามารถเปลี่ยนเป็น Firefox, Edge ได้
${VALID_USERNAME}    testuser
${VALID_PASSWORD}    Password123
${INVALID_PASSWORD}  wrongpassword

***Keywords***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window

Close Browser Session
    Close Browser

Input Username
    [Arguments]    ${username}
    Input Text     id=username    ${username}    # เปลี่ยน id=username 
Input Password
    [Arguments]    ${password}
    Input Text     id=password    ${password}    # เปลี่ยน id=password 
Click Login Button
    Click Button   id=loginButton                 # เปลี่ยน id=loginButton 

Verify Successful Login
    Wait Until Page Contains    Welcome,    timeout=10s    
    Location Should Contain     /dashboard                     

Verify Error Message
    [Arguments]    ${expected_message}
    Wait Until Element Contains    id=errorMessage   ${expected_message}    timeout=5s    #  id=errorMessage
    Page Should Contain            ${expected_message}