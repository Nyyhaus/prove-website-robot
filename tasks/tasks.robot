*** Settings ***
Documentation       Order testing and guides from Prove Expertise Oy
...                 Download excel file
...                 Go to Prove website with Chrome
...                 Accept cookies
...                 Change currency
...                 Get in touch with data from excel and vault file
...                 Go to pentesting and export description to pdf
...                 Take screenshot of pentesting image
...                 Embed screenshot of the pentesting to pdf
...                 Buy Storytools of Testing
...                 Do the same with Firefox
...                 Create ZIP archive of the pdfs and images

Library             RPA.Browser.Selenium
Library             RPA.PDF
Library             RPA.Archive
Library             RPA.Excel.Files
Library             RPA.HTTP
Resource            resources/variables.resource

Suite Teardown      Close All Browsers


*** Tasks ***
Order tests with Chrome from Prove Expertise Oy
    Download Excel file
    Open the Prove website with Chrome
    Accept cookies
    Verify that currency is in Euros
    Get in touch
    Export pentesting description as a PDF
    Buy a testing guide
    Close Chrome browser

Order tests with Firefox from Prove Expertise Oy
    Open the Prove website with Firefox
    Accept cookies
    Verify that currency is in Euros
    Get in touch
    Export pentesting description as a PDF
    Buy a testing guide
    Create a ZIP file of pentesting files

*** Keywords ***
Download Excel file
    # Downloads excel file overwriting the old one
    Download    ${download_url}    overwrite=True

Open the Prove website with Chrome
    # Open prove.fi with maximized chrome 
    Open Chrome Browser    ${URL}    maximized=True

Accept cookies
    # Waits until cookie prompt is visible and accepts all cookies
    Click Button When Visible    ${accept_cookies}

Verify that currency is in Euros
    # Ensures that currency and country is Euro | Finland
    Click Button    ${currency_dropdown}
    Click Element    ${currency}

Get in touch
    # Opens excel file, goes to get in touch page, reads data form excel,
    # loop keyword five times that fills the form, close excel file  
    Open Workbook    ${excel_file}
    Click Element    ${get_in_touch}

    ${sales_reps}=    Read Worksheet As Table    header=True

    FOR    ${sales_rep}    IN    @{sales_reps}
        Fill the form for one person    ${sales_rep}
        ${i}=    Evaluate    ${i} + 1
        IF    ${i}==5    BREAK
    END
    Close Workbook

Fill the form for one person
    # Gets parameter that includes one row from excel from the
    # get in touch keyword and inserts the right items from the
    # row to correct places
    [Arguments]    ${sales_rep}

    Wait Until Element Is Visible    ${frame}
    Select Frame    ${frame}

    Input Text When Element Is Visible    ${name}
    ...    ${sales_rep}[First Name] ${sales_rep}[Last Name]

    Input Text    ${email}    ${email_address}
    Input Text    ${phone}    ${sales_rep}[Sales]
    Input Text    ${company}    ${company_name}
    Input Text    ${message_field}    ${message}

    Click Element    ${real_person}
    Reload Page

Buy a testing guide
    # Add Storytools of Testing to cart and remove it from the cart
    Click Element When Clickable    ${guides}
    Click Element When Clickable    ${storytools}
    Click Button When Visible    ${submit}
    Click Element When Visible    ${remove}

Export pentesting description as a PDF
    # wait until page loads and get text from pentesting description and
    # insert into pdf with a screenshot of a pentesting image
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

Close Chrome browser
    # Close chrome
    Close Browser

Open the Prove website with Firefox
    # When using docker, run firefox in headlessmode
    # Open Browser    ${URL}    browser=headlessfirefox
    Open Browser    ${URL}    browser=firefox

Create a ZIP file of pentesting files
    # Zip image and pdf
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
