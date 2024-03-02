TODO: global variables with uppercase!

*** Variables ***
# this is a counter for function that loops through the excel data
# set this to determine how many rows of excel data you want to use
${i}    0

# browser settings
${URL}		https://www.prove.fi/    
${browser}    chrome

# get in touch values in vault file, uncomment these if not using vault 
# and add them to code replacing the vault variables
${email_address}    text@gmail.com
${message}           Hi Prove!     
${company_name}      My Company Oy

# files containing data for robot to use
${excel_file}    SalesData.xlsx

# cookie banner selectors
${accept_cookies}    shopify-pc__banner__btn-accept

# currency selectors
${currency_dropdown}    //*[@id="HeaderCountryForm"]/div/div/button
${currency}            //*[@id="HeaderCountryList"]/li[7]/a

# get in touch selectors
${get_in_touch}    xpath://*[contains(text(), "GET IN TOUCH")]
${frame}            xpath=//iframe[contains(@src,'id')]
${name}            V2ViRm9ybUNhcHR1cmVCbG9jazphNGY5ZTg0MS04M2Q4LTExZWUtOTE4Zi1iYjEwOWM2NDA4Mzg
${email}            //*[@type="email"]
${phone}        xpath:/html/body/div/div/div/div/form/div[4]/div/input
${company}        V2ViRm9ybUNhcHR1cmVCbG9jazpiNmQzMzg1MC04NDUwLTExZWUtYWFjYy01ZjRiNmRhOGQ2MTU
${message_field}        css:.sc-gEvEer.iLwEXI
${real_person}    css:.sc-dcJsrY.iJrSJu

# buy testing guide selectors
${guides}    //*[@id="HeaderMenu-guides"]
${storytools}    //*[@id="HeaderMenu-guides-storytools-of-testing"]
${submit}        //*[@id="ProductSubmitButton-template--20187181646171__main"]
${remove}        Remove-1

# investigate pentesting selectors
${testing_services}    //SPAN[normalize-space(text())="Testing Services"]
${pentesting}            (//A[normalize-space(text())="Penetration Testing"])[2]
${pentest_description}    //*[@id="ProductAccordion-dce7b1cd-2dc9-40cf-8575-cd7e7fb2347d-template--20337025122651__main"] 
${pentest_img_selector}    //*[@id="Slide-template--20337025122651__main-45140319109467"]/div/modal-opener/div[2]/img
