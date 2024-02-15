*** Settings ***
Documentation       Order testing and guides from Prove Expertise Oy
...                 Change currency
...                 Download excel file
...                 Get in touch with data from excel
...                 Register to security webinar
...                 Buy storytools of testing
...                 Take screenshot of shopping cart
...                 Embed screenshot of the order to pdf receipt
...                 Create ZIP archive of the receipts and images

Library             RPA.Browser.Selenium
Library             RPA.PDF
Library             RPA.Archive
Library             RPA.Excel.Files
Resource            resources/variables.resource

Suite Teardown      Close All Browsers


*** Tasks ***
Order tests from Prove Expertise Oy
    Open the test order website
    Accept cookies
    Select currency
    Get in touch
    Export pentesting description as a PDF
    Buy a testing guide
    Create a ZIP file of pentesting files
    # Enter billing information


*** Keywords ***
Open the test order website
    Open Browser    ${URL}    ${browser}

Accept cookies
    Click Button    ${accept_cookies}

Select currency
    Click Button     ${currency_dropdown}
    Click Element    ${currency}

Get in touch
    Open Workbook    ${excel_file}
    Click Element    ${get_in_touch}

    ${sales_reps}=    Read Worksheet As Table    header=True
    FOR    ${sales_rep}    IN    @{sales_reps}
        Fill the form for one person    ${sales_rep}
    END
    Close Workbook

Fill the form for one person
    [Arguments]    ${sales_rep}

    Wait Until Element Is Visible    ${frame}
    Select Frame    ${frame}

    Input Text When Element Is Visible    ${name}                    ${sales_rep}[First Name]
    Input Text        ${name}             ${sales_rep}[Last Name]
    Input Text        ${email}            ${email_address}
    Input Text        ${phone}            ${sales_rep}[Sales]
    Input Text        ${company}          ${company_name}
    Input Text        ${message_field}    ${message}
    Click Element     ${real_person}

    Unselect Frame
    Reload Page

Buy a testing guide
    Click Element When Clickable      ${guides}
    Click Element When Clickable      ${storytools}
    Click Button When Visible         ${submit}
    Click Element When Visible        ${remove}

Export pentesting description as a PDF
    Click Element When Clickable    ${testing_services}
    Click Element When Clickable    ${pentesting}

    ${pentesting_info_html}=    Get Element Attribute    ${pentest_description}    outerHTML
    Html To Pdf    ${pentesting_info_html}    ${OUTPUT_DIR}${/}pentesting-info${/}pentesting-info.pdf

    ${img}=    Capture Element Screenshot
    ...    ${pentest_img_selector}
    ...    ${OUTPUT_DIR}${/}pentesting-info${/}pentesting.png

    Open Pdf    ${OUTPUT_DIR}${/}pentesting-info${/}pentesting-info.pdf
    ${files}=    Create List    ${img}
    Add Files To Pdf    ${files}    ${OUTPUT_DIR}${/}pentesting-info${/}pentesting-info.pdf    True
    Save Pdf    ${OUTPUT_DIR}${/}pentesting-info${/}pentesting-info.pdf
    Close Pdf    ${OUTPUT_DIR}${/}pentesting-info${/}pentesting-info.pdf

Create a ZIP file of pentesting files
    Archive Folder With Zip    ${OUTPUT_DIR}${/}pentesting-info${/}    pentesting-info.zip

# Enter billing information
#    Click Element When Clickable    //*[@id="basic"]/div/div[2]/label

#    Click Element    Select0
#    Click Element When Visible    //*[@id="Select0"]/option[3]
#    Input Text    name:firstName    text
#    Input Text    name:lastName    text
#    Input Text    name:company    text
#    Input Text    name:address1    text
#    Input Text    name:postalCode    text
#    Input Text    name:postalCode    90000
#    Input Text    name:city    text
#    Input Text    name:phone    12345678901-
