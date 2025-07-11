***Settings***
Resource        resources_search.robot  # เรียกใช้ไฟล์ resource ที่สร้างไว้
Test Setup      Open Browser To Product Page
Test Teardown   Close Browser Session

***Test Cases***
Search For Existing Product - Exact Match
    Input Search Term            Laptop XYZ          # ชื่อสินค้าที่อยู่ในระบบ
    Click Search Button
    Verify Product Is Displayed  Laptop XYZ

Search For Existing Product - Partial Match
    Input Search Term            Laptop             # ค้นหา Laptop
    Click Search Button
    Verify Product Is Displayed  Laptop XYZ         # ตรวจสอบว่าสินค้าที่เกี่ยวข้อง
    Verify Product Is Displayed  Laptop ABC         # หากมีสินค้าอื่นที่เข้าเกณฑ์ 

Search For Non-Existing Product
    Input Search Term            Nonexistent Item
    Click Search Button
    Verify No Results Message Is Displayed

Search With Empty Query
    Input Search Term            ${EMPTY}           # ใช้ ${EMPTY} สำหรับค่าว่าง
    Click Search Button
    # การดำเนินการที่คาดหวังเมื่อค้นหาว่างเปล่าอาจแตกต่างกันไป:
    # 1. แสดงข้อความแจ้งเตือน:
    # Verify Error Message       Please enter a search term  # หากมี Keyword สำหรับ Verify Error Message
    # 2. แสดงสินค้าทั้งหมด:
    # Verify Product Is Displayed  Product A
    # Verify Product Is Displayed  Product B
    # 3. ไม่เกิดอะไรขึ้น:
    # Page Should Contain Element   ${SEARCH_BAR_LOCATOR} # ยังคงอยู่ที่หน้าเดิม

Search With Leading And Trailing Spaces
    Input Search Term            ${SPACE}Laptop${SPACE} # ค้นหา " Laptop " (มีช่องว่างหน้าหลัง)
    Click Search Button
    Verify Product Is Displayed  Laptop                 # คาดว่าระบบจะตัดช่องว่างออก

Search With Case Insensitivity
    Input Search Term            apple                  # ค้นหาด้วยตัวพิมพ์เล็ก
    Click Search Button
    Verify Product Is Displayed  Apple                  # คาดว่าระบบจะหาเจอ (case-insensitive)

Search With Special Characters
    Input Search Term            T-Shirt #1             # ค้นหาด้วยอักขระพิเศษ
    Click Search Button
    Verify Product Is Displayed  T-Shirt #1             # คาดว่าระบบจะจัดการอักขระพิเศษได้ถูกต้อง