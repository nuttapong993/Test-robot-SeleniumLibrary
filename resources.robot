***Settings***
Library    SeleniumLibrary    # Import SeleniumLibrary

***Variables***
${LOGIN_URL}      http://localhost:8080/login   # เปลี่ยนเป็น URL ของหน้า Login จริงๆ ของคุณ
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
    Input Text     id=username    ${username}    # เปลี่ยน id=username เป็น Selector ที่ถูกต้องของช่อง Username ของคุณ

Input Password
    [Arguments]    ${password}
    Input Text     id=password    ${password}    # เปลี่ยน id=password เป็น Selector ที่ถูกต้องของช่อง Password ของคุณ

Click Login Button
    Click Button   id=loginButton                 # เปลี่ยน id=loginButton เป็น Selector ที่ถูกต้องของปุ่ม Login ของคุณ

Verify Successful Login
    Wait Until Page Contains    Welcome,    timeout=10s    # หรือข้อความอื่นๆ ที่แสดงว่า Login สำเร็จ
    Location Should Contain     /dashboard                     # เปลี่ยน /dashboard เป็น URL ของหน้าหลัง Login สำเร็จ

Verify Error Message
    [Arguments]    ${expected_message}
    Wait Until Element Contains    id=errorMessage   ${expected_message}    timeout=5s    # เปลี่ยน id=errorMessage เป็น Selector ของ Element ที่แสดงข้อความ Error
    Page Should Contain            ${expected_message}