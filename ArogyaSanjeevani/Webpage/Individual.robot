*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://10.100.20.34:9190/web/guest/asquote
${browser}        chrome
${Prospername}    Rekha
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
    Go To    ${url}
    Maximize Browser Window
    

*** Test Cases ***

1 Adult with STP-Age 18
    # Open Browser    ${url}    ${browser}
    # Maximize Browser Window
    Jenkins browser launch
    Set Selenium Implicit Wait    40s
    Set Selenium Speed    1s
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Input Text    id=prospermobileno    ${MobileNumber}
    Input Text    id=prosperemail    ${EmailID}
    #Select Sum Insured for STP 1 lakh
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
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    ${city}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    #Press Keys    button    ENTER
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    #Press Key    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ENTER
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
    Click Element    id=lifestylesubmit
    Click Element    xapth=.//ul[@id='lifestyleform-single']/li[1]//span/label[@for='alcoholno']
    Sleep    5s
    Click Element    xapth=.//ul[@id='lifestyleform-single']/li[4]//span/label[contains(.,'No')]
    Sleep    5s
    Click Element    xapth=.//ul[@id='lifestyleform-single']/li[7]//span/label[contains(.,'No')]
    Sleep    5s
    Click Element    xapth=.//ul[@id='lifestyleform-single']/li[10]//span/label[contains(.,'No')]
    Sleep    5s
    Click Element    id=lifestylesubmit
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[1]/div[1]/div
    Select From List By Value    id=genetalDetailGender    Brother
    #Click Element    id=generaldetailsubmit

1 Adult with NON-STP-Age 51
    # Open Browser    ${url}    ${browser}
    # Maximize Browser Window
    Jenkins browser launch
    Set Selenium Implicit Wait    40s
    Set Selenium Speed    1s
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1968
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
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    ${city}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    #Press Keys    button    ENTER
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    #Press Key    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ENTER
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
    Click Element    xapth=.//ul[@id='lifestyleform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xapth=.//ul[@id='lifestyleform-single']/li[2]//span/label[contains(.,'No')]
    Click Element    xapth=.//ul[@id='lifestyleform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xapth=.//ul[@id='lifestyleform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    id=lifestylesubmit
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[1]/div[1]/div
    Select From List By Value    id=genetalDetailGender    Brother
    #Click Element    id=generaldetailsubmit

1 Adult with NON-STP-Age 25
    # Open Browser    ${url}    ${browser}
    # Maximize Browser Window
    Jenkins browser launch
    Set Selenium Implicit Wait    40s
    Set Selenium Speed    1s
    Click Element    xpath=.//div[@class='individualRadio coverageradio bigradiobutton']
    Input Text    id=prospername    ${Prospername}
    Click Element    id=individualDOB
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1993
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
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='contactCity']    ${city}
    Click Element    xpath=.//ul[@id='contactform-single']/li[4]
    #Press Keys    button    ENTER
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    Input Text    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ${pincode}
    Click Element    xpath=.//ul[@id='contactform-single']/li[6]
    #Press Key    xpath=.//ul[@id='contactform-single']/li//div[starts-with(@class,'formfieldHolder')]/div/input[@id='pinCode']    ENTER
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
    Click Element    xapth=.//ul[@id='lifestyleform-single']/li[1]//span/label[contains(.,'No')]
    Click Element    xapth=.//ul[@id='lifestyleform-single']/li[2]//span/label[contains(.,'No')]
    Click Element    xapth=.//ul[@id='lifestyleform-single']/li[3]//span/label[contains(.,'No')]
    Click Element    xapth=.//ul[@id='lifestyleform-single']/li[4]//span/label[contains(.,'No')]
    Click Element    id=lifestylesubmit
    Click Element    xpath=.//ul[@id='generaldetailsform-single']/li[1]/div[1]/div
    Select From List By Value    id=genetalDetailGender    Brother
    #Click Element    id=generaldetailsubmit
