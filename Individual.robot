*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Baseurl}            http://10.100.20.34:9190/web/guest/asquote
${browser}        chrome
${Prospername}    Rajesh
${MobileNumber}    9000080901
${EmailID}        qctest1@fsnf.dds
${Lastname}       Mohan
${pan no}         AAAPZ1234C
${addrs1}         njdnsfjdjfsdjbfsbfb
${addrs2}         njdnsfjdjnmmkkgfsbfb
${city}           CHENNAI
${pincode}        600988
${height_val}     115
${weight_val}     40

*** Keywords ***
Jenkins browser launch
    Set Selenium Speed    1s
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox
    Create WebDriver  Chrome  chrome_options=${chrome_options}
    Go To    ${Baseurl}
    #Maximize Browser Window
    Set Browser Implicit Wait    15s
    
Local browser launch
    # Set Selenium Speed    1s
    Open Browser     ${Baseurl}    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    15s

Scroll down
    Sleep    2s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    
*** Test Cases ***
1 Adult with STP-Age 18
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    Scroll down
    Click Element    xpath=.//div[@id='planyears']//ul//li[1]
    Sleep    3s
    Scroll down
    Click Element    xpath=.//a[@id='familycombinationCont']
    Scroll down
    Click Element    xpath=.//a[@id='cityCont1']
    Scroll down
    Click Element    id=proceed
    Scroll down
    Click Element    id=closeproceed
    Scroll down
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//*[@for='proposergendermale']
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Scroll down
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Scroll down
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    ${city}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Scroll down
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Scroll down
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[@for='consultedDoctorno']
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 400)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[@for='tmdregularno']
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Scroll down
    Click Element    id=medicaldetailsubmit
    Scroll down
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[1]//span/label[@for='alcoholno']
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[7]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[10]//span/label[contains(.,'No')]
    Sleep    5s
    Click Element    id=lifestylesubmit
    #General Details
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[1]/div[1]/div
    Select From List By Label    id=genetalDetailGender    Brother
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[2]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[2]/div[@class='formfieldHolder']//input    suresh
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[3]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[3]/div[@class='formfieldHolder']//input    Mohan
    Scroll down
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Scroll down
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Scroll down
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Scroll down
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    4s
    ${QUOTEID_C}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    ${QUOTEID_C}
    Close Browser
   
    
