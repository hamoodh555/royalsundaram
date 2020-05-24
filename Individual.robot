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
    Set Window Size    1024    786
    Go To    ${Baseurl}
    #Maximize Browser Window
    Set Browser Implicit Wait    15s
    
Local browser launch
    # Set Selenium Speed    1s
    Open Browser     ${Baseurl}    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    15s

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
    Click Element    xpath=.//div[@id='planyears']//ul//li[1]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//*[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
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
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[@for='consultedDoctorno']
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[@for='tmdregularno']
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
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
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    ${quote_id_val}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id_val}
    Close All Browsers

1 Adult with NON-STP-Age 51
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1968
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[3]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//*[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    kuhdg1234f
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    sdmfjkfknna
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    kjdhvjksjfkhd
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    CALICUT
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[@for='consultedDoctorno']
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Sleep    5s
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[@for='tmdregularno']
    Sleep    5s
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Sleep    5s
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Sleep    10s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[1]//span/label[contains(.,'No')]
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
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

1 Adult with NON-STP-Age 25
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[5]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    ADUR KERALA
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[@for='consultedDoctorno']
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Sleep    5s
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[@for='tmdregularno']
    Sleep    5s
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Sleep    5s
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[1]//span/label[contains(.,'No')]
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
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

1 Adult with NON-STP-Age 30
    Jenkins browser launch
    Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1990
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[4]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    COIMBATORE
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[contains(.,'Yes')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Sleep    5s
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[contains(.,'No')]
    Sleep    5s
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Sleep    5s
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Sleep    10s
    #########Additional Medical Details#######
    Execute JavaScript    window.scrollTo(0,1000)
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[2]//p[@class='illnessnametitle']
    Input Text    xpath=.//ul[@id='addmedicalform-single']/li[2]//div[2]/div/input    Anxiety disorders
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[3]/div/p
    Select From List By Label    id=firstDiagnosisMonth11    July
    Select From List By Label    id=firstDiagnosisYear11    2006
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[4]/div/div/div[1]/p
    Select Radio Button    @id=tmreceived11
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[5]/div/div/div[1]/p
    Select From List By Label    id=treatmentOutcome11    Fully Cured
    Click Element    id=addmedicalinfosubmit
    #########Additional Medical Details End#######
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[7]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[10]//span/label[contains(.,'No')]
    Click Element    id=lifestylesubmit
    #General Details
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[1]/div[1]/div
    Select From List By Label    id=genetalDetailGender    Brother
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[2]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[2]/div[@class='formfieldHolder']//input    suresh
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[3]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[3]/div[@class='formfieldHolder']//input    Mohan
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Sleep    3s
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

1 Adult with NON-STP-Age 50
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1968
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[3]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//*[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    kuhdg1234f
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    sdmfjkfknna
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    kjdhvjksjfkhd
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    CALICUT
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    100
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    40
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[@for='consultedDoctorno']
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Sleep    5s
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[@for='tmdregularno']
    Sleep    5s
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Sleep    5s
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Sleep    10s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[1]//span/label[contains(.,'No')]
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
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

1 Adult with STP-Age 65
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1955
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[1]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    #Insured Member Details
    Select From List By Label    id=relationShipProposer1    Spouse
    Input Text    id=prospername1    neela
    Click Element    id=individualDOB
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    THANJAVUR
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
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
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

1 Adult with NON-STP-Age 67
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1953
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[3]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    #Insured Member Details
    Select From List By Label    id=relationShipProposer1    Spouse
    Input Text    id=prospername1    suja
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1968
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    TRICHY
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
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
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

1 Adult with NON-STP-Age 80
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1940
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[5]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    #Insured Member Details
    Select From List By Label    id=relationShipProposer1    Spouse
    Input Text    id=prospername1    Renu
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1995
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    TRICHY
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
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
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

1 Adult with NON-STP-Age 96
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1923
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[4]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    #Insured Member Details
    Select From List By Label    id=relationShipProposer1    Spouse
    Input Text    id=prospername1    Ranjini
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1990
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    TRICHY
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[contains(.,'Yes')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    #########Additional Medical Details#######
    Execute JavaScript    window.scrollTo(0,1000)
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[2]//p[@class='illnessnametitle']
    Input Text    xpath=.//ul[@id='addmedicalform-single']/li[2]//div[2]/div/input    Anxiety disorders
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[3]/div/p
    Select From List By Label    id=firstDiagnosisMonth11    July
    Select From List By Label    id=firstDiagnosisYear11    2006
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[4]/div/div/div[1]/p
    Select Radio Button    @id=tmreceived11
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[5]/div/div/div[1]/p
    Select From List By Label    id=treatmentOutcome11    Fully Cured
    Click Element    id=addmedicalinfosubmit
    #########Additional Medical Details End#######
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[7]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[10]//span/label[contains(.,'No')]
    Click Element    id=lifestylesubmit
    #General Details
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[1]/div[1]/div
    Select From List By Label    id=genetalDetailGender    Brother
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[2]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[2]/div[@class='formfieldHolder']//input    suresh
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[3]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[3]/div[@class='formfieldHolder']//input    Mohan
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Sleep    3s
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

1 Adult with NON-STP-Age 70
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1950
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[2]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    #Insured Member Details
    Select From List By Label    id=relationShipProposer1    Spouse
    Input Text    id=prospername1    manju
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1970
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    TRICHY
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    100
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    40
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
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
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

1 Adult with STP-Age 65 with Daughter
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1953
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[1]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    #Insured Member Details
    Select From List By Label    id=relationShipProposer1    Daughter
    Input Text    id=prospername1    manju
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    2002
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    TRICHY
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
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
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

Individual with STP case 80 age and 3lakhs and daughter
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1940
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[5]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    #Insured Member Details
    Select From List By Label    id=relationShipProposer1    Daughter
    Input Text    id=prospername1    Rekha
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1997
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    TRICHY
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
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
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

Individual with STP case 96 age ,2.5lakhs and daughter
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1923
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[4]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    #Insured Member Details
    Select From List By Label    id=relationShipProposer1    Daughter
    Input Text    id=prospername1    Ranjini
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    2000
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    TRICHY
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[contains(.,'Yes')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    #########Additional Medical Details#######
    Execute JavaScript    window.scrollTo(0,1000)
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[2]//p[@class='illnessnametitle']
    Input Text    xpath=.//ul[@id='addmedicalform-single']/li[2]//div[2]/div/input    Anxiety disorders
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[3]/div/p
    Select From List By Label    id=firstDiagnosisMonth11    July
    Select From List By Label    id=firstDiagnosisYear11    2006
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[4]/div/div/div[1]/p
    Select Radio Button    @id=tmreceived11
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[5]/div/div/div[1]/p
    Select From List By Label    id=treatmentOutcome11    Fully Cured
    Click Element    id=addmedicalinfosubmit
    #########Additional Medical Details End#######
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[7]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[10]//span/label[contains(.,'No')]
    Click Element    id=lifestylesubmit
    #General Details
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[1]/div[1]/div
    Select From List By Label    id=genetalDetailGender    Brother
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[2]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[2]/div[@class='formfieldHolder']//input    suresh
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[3]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[3]/div[@class='formfieldHolder']//input    Mohan
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Sleep    3s
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

Individual with STP case 70 age ,1.5lakhs and daughter
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1950
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[2]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    #Insured Member Details
    Select From List By Label    id=relationShipProposer1    Daughter
    Input Text    id=prospername1    manju
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1997
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    TRICHY
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    100
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    40
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
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
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

Individual with STP case 65 age and 1lakhs and son
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1953
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[1]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    #Insured Member Details
    Select From List By Label    id=relationShipProposer1    Son
    Input Text    id=prospername1    Mani
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    2002
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    TRICHY
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
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
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

Individual with STP case 80 age and 3lakhs and son
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1940
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[5]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    #Insured Member Details
    Select From List By Label    id=relationShipProposer1    Son
    Input Text    id=prospername1    Sathish
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1997
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    TRICHY
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
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
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    #${quote_id}    Get Text    id=payoptQuoteId
    #Log To Console    QuoteID is    ${quote_id}
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

Individual with STP case 96 age ,2.5lakhs and Son
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1923
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[4]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    #Insured Member Details
    Select From List By Label    id=relationShipProposer1    Son
    Input Text    id=prospername1    Ranjini
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    2000
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    TRICHY
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    ${height_val}
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    ${weight_val}
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[contains(.,'Yes')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    #########Additional Medical Details#######
    Execute JavaScript    window.scrollTo(0,1000)
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[2]//p[@class='illnessnametitle']
    Input Text    xpath=.//ul[@id='addmedicalform-single']/li[2]//div[2]/div/input    Anxiety disorders
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[3]/div/p
    Select From List By Label    id=firstDiagnosisMonth11    July
    Select From List By Label    id=firstDiagnosisYear11    2006
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[4]/div/div/div[1]/p
    Select Radio Button    @id=tmreceived11
    Click Element    xpath=.//ul[@id='addmedicalform-single']/li[5]/div/div/div[1]/p
    Select From List By Label    id=treatmentOutcome11    Fully Cured
    Click Element    id=addmedicalinfosubmit
    #########Additional Medical Details End#######
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[7]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='lifestyleform-single']/li[10]//span/label[contains(.,'No')]
    Click Element    id=lifestylesubmit
    #General Details
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[1]/div[1]/div
    Select From List By Label    id=genetalDetailGender    Brother
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[2]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[2]/div[@class='formfieldHolder']//input    suresh
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[3]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[3]/div[@class='formfieldHolder']//input    Mohan
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Sleep    3s
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers

Individual with STP case 70 age,1.5lakhs and son
    Jenkins browser launch
    #Local browser launch
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1950
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[2]
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    #Insured Member Details
    Select From List By Label    id=relationShipProposer1    Son
    Input Text    id=prospername1    manju
    Click Element    id=individualDOB
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1997
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='cityCont1']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=proceed
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    id=closeproceed
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Last Name')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='lastName']    ${Lastname}
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'Gender')]
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div[@class='form-group']/span[@class='radio-holder']/label[@for='proposergendermale']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='proposalform-single']/li//div[@class='formheader']/div/div[1]/p[contains(.,'PAN')]
    Input Text    xpath=.//ul[@id='proposalform-single']/li//div[@class='formfieldHolder']/div/input[@id='panNo']    ${pan no}
    Click Element    xpath=.//*[@id='proposerdetailsubmit']
    #Proposal Information Tab
    Click Element    xpath=.//ul[@id='contactform-single']/li[1]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address1']    ${addrs1}
    Click Element    xpath=.//ul[@id='contactform-single']/li[2]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='address2']    ${addrs2}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    TRICHY
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Click Element    xpath=.//*[@id='contactdetailsubmit']
    Click Element    xpath=.//ul[@id='insuredform-single']/li[7]
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='height1']    100
    Input Text    xpath=.//ul[@id='insuredform-single']/li//div[@class='formfieldHolder']/div/div//input[@name='weight1']    40
    Click Element    id=insuredetailsubmit
    Click Element    xpath=.//ul[@id='medicalform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[2]//span/label[contains(.,'No')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, 900)
    Click Element    xpath=.//ul[@id='medicalform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[5]//span/label[contains(.,'No')]
    Click Element    xpath=.//ul[@id='medicalform-single']/li[6]//span/label[contains(.,'No')]
    Click Element    id=medicaldetailsubmit
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
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
    Click Element    xpath=//ul[@id='generaldetailsform-single']/li[4]/div[1]/div
    Select From List By Label    xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[1]/div
    Input Text    xpath=.//ul[@id='generaldetailsform-single']/li[11]/div[@class='formfieldHolder']//input    9687465423
    Click Element    id=generaldetailsubmit
    Handle Alert
    Input Text    id=mobileOTP    123456
    Click Element    id=mobileOTPSubmit
    Click Element    id=declaration
    Click Element    xpath=.//button[@class='close close-dec']
    Click Element    id=confirm
    Switch Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//li[@class='Billdesk']/div
    Click Element    id=makepayment
    Sleep    3s
    ${quote_id}=    Get Text    xpath=(.//table[@class='table back-tab-res']//tr)[2]/td[2]
    Log    QuoteID is    ${quote_id}
    Close All Browsers
    
