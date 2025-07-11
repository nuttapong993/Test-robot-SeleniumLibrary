***Settings***
Library    SeleniumLibrary    # นำเข้า SeleniumLibrary 

***Variables***
${HOMEPAGE_URL}         http://localhost:8080/products  # **แก้ไข: URL ของหน้าหลักที่มี Search Bar**
${BROWSER}              Chrome                          # Firefox, Edge ได้
${SEARCH_BAR_LOCATOR}   id=searchBar                    #  Selector ของช่อง Search Bar (ID, Name, XPath, CSS)**
${SEARCH_BUTTON_LOCATOR} id=searchButton                #  Selector ปุ่ม Search (ID, Name, XPath, CSS)**
${NO_RESULTS_MESSAGE_LOCATOR}  xpath=//div[@class='no-results-message'] # ข้อความ "ไม่พบผลลัพธ์"**

***Keywords***
Open Browser To Product Page
    Open Browser    ${HOMEPAGE_URL}    ${BROWSER}
    Maximize Browser Window

Close Browser Session
    Close Browser

Input Search Term
    [Arguments]    ${search_term}
    Input Text     ${SEARCH_BAR_LOCATOR}    ${search_term}

Click Search Button
    Click Button   ${SEARCH_BUTTON_LOCATOR}

Verify Product Is Displayed
    [Arguments]    ${product_name}
    Wait Until Page Contains    ${product_name}    timeout=10s  
    Page Should Contain Element    xpath=//div[contains(@class, 'product-item') and contains(., '${product_name}')]

Verify No Results Message Is Displayed
    Wait Until Element Is Visible    ${NO_RESULTS_MESSAGE_LOCATOR}    timeout=5s
    Element Should Contain           ${NO_RESULTS_MESSAGE_LOCATOR}    No results found    # **แก้ไข: ข้อความ "ไม่พบผลลัพธ์" ที่แสดงจริง**