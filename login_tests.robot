***Settings***
Resource    resources.robot       # เรียกใช้ไฟล์ resources.robot ที่สร้างไว้
Test Setup      Open Browser To Login Page
Test Teardown   Close Browser Session

***Test Cases***
Successful Login With Valid Credentials
    Input Username           ${VALID_USERNAME}
    Input Password           ${VALID_PASSWORD}
    Click Login Button
    Verify Successful Login

Login With Invalid Password
    Input Username           ${VALID_USERNAME}
    Input Password           ${INVALID_PASSWORD}
    Click Login Button
    Verify Error Message     Invalid username or password    # เปลี่ยนเป็นข้อความ Error ที่ระบบคุณแสดงจริง

Login With Empty Username
    Input Username           ${EMPTY}                       # ${EMPTY} เป็นตัวแปรใน Robot Framework สำหรับค่าว่าง
    Input Password           ${VALID_PASSWORD}
    Click Login Button
    Verify Error Message     Username is required           # เปลี่ยนเป็นข้อความ Error ที่ระบบคุณแสดงจริง (อาจเป็น Client-side validation)

Login With Empty Password
    Input Username           ${VALID_USERNAME}
    Input Password           ${EMPTY}
    Click Login Button
    Verify Error Message     Password is required           # เปลี่ยนเป็นข้อความ Error ที่ระบบคุณแสดงจริง (อาจเป็น Client-side validation)

Login With Empty Username And Password
    Input Username           ${EMPTY}
    Input Password           ${EMPTY}
    Click Login Button
    Verify Error Message     Username is required           # ตรวจสอบข้อความ Error สำหรับ Username
    Verify Error Message     Password is required           # ตรวจสอบข้อความ Error สำหรับ Password