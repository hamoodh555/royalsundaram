*** Settings ***
Library    SeleniumLibrary 

*** Variables ***
${Baseurl}    http://10.100.20.34:9190/web/guest/asquote
# ${Baseurl}    https://www.royalsundaram.net/web/dtctest/asquote
${Proposername}    Proposer First name
${MobileNumber}  9874563210
${EmailID}    qcteam1@xerago.mail
${Lastname}    Proposer Last name
${OTP}    123456

*** Keywords ***
Jenkins browser launch
    Set Selenium Speed    1s
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox
    Create WebDriver  Chrome  chrome_options=${chrome_options}
    Go To    ${Baseurl}
    Maximize Browser Window
    Set Browser Implicit Wait    15s
    
Local browser launch
    # Set Selenium Speed    1s
    Open Browser     ${Baseurl}    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    15s
Choose the Cover Type
    Click Element    xpath=.//div[@class='familyfloaterRadio coverageradio bigradiobutton']
    
Name of Proposer
     Input Text    id=prospername    ${Proposername} 
     
Proposer DOB
     Click Element    xpath=.//input[@id='individualDOB']
     
Proposer Mobile Number
    Input Text    id=prospermobileno    ${MobileNumber}
    
Proposer email
    Input Text    id=prosperemail    ${EmailID}
    
Select Second Adult
    Click Element   xpath=.//ul[@class='familylist adults']//li[2]
    
Select Third Adult
    Click Element   xpath=.//ul[@class='familylist adults']//li[3]
    
Select Fourth Adult
    Click Element   xpath=.//ul[@class='familylist adults']//li[4]
    
Select Fifth Adult
    Click Element   xpath=.//ul[@class='familylist adults']//li[5]
    
Select First child
    Click Element    xpath=.//ul[@class='familylist children']//li[1]
    
Select Second child
    Click Element    xpath=.//ul[@class='familylist children']//li[2] 
        
Select Sum Insured for STP 1 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[1]
    
Select Sum Insured for STP 1.5 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[2]
    
Select Sum Insured for STP 2 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[3]
    
Select Sum Insured for STP 2.5 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[4]
    
Select Sum Insured for STP 3 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[5]
    
Click the Continue button
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    
Click the next button 
    Sleep    2s      
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='insurenext'] 
            
Click the Premium detail button
    Sleep    4s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)   
    Click Element    xpath=.//a[@id='cityCont1']
    
Click the proceed button in Premium Details Page
    Sleep    15s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='proceed']
    
Click the Proceed button in model pop
     Sleep    2s
     SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
     Click Element    xpath=.//div[@class='modal-content']//button[@id='closeproceed']
     
Click contact details button
     Sleep    1s
     SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
     Click Element    xpath=.//input[@id='proposerdetailsubmit']
      
Click Insured details button
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//input[@id='contactdetailsubmit']
    
Click MEDICAL QUESTIONS button
    Sleep    5s  
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//input[@id='insuredetailsubmit']
    
Click ADDITIONAL MEDICAL INFORMATION button
    Sleep    5s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//input[@id='medicaldetailsubmit']
    
Click GENERAL INFORMATION button
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//input[@id='lifestylesubmit']
    
Click PAYMENT DETAILS button
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//input[@id='generaldetailsubmit']
    
Handle OTP Alert message
    Sleep    3s    
    Handle Alert    accept
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    xpath=.//input[@id='mobileOTP']    ${OTP}
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)   
    Click Element    xpath=.//input[@id='mobileOTPSubmit']
    
Handle declaration and Terms and Condition
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//input[@id='declaration'] 
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//button[@class='close close-dec']    
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//input[@id='confirm']
    Sleep    3s             
    Select Window    title=Royal Sundaram | Arogya Sanjeevani Health Insurance
    
Handle Payment Details
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//ul[@class='valuts_section']//li[@class='Billdesk']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight) 
    Click Element    xpath=.//input[@id='makepayment']  
    
Get Quote ID
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight) 
    ${QUOTEID_C}=    Get Text    id=Quoteidright
    # ${QUOTEID_T}=    Convert To String    ${QUOTEID_C}
    Log To Console    ${QUOTEID_C}
    Log   ${QUOTEID_C} 

Medical yes
    Click lifestyle button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight) 
    Input Text    xpath=.//input[@name='pastIllName11']    Heart attack 
    Click lifestyle button
    Click lifestyle button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight) 
    Select From List By Label    name=firstDiagnosisMonth11    January 
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight) 
    Select From List By Value    name=firstDiagnosisYear11    2019
    Click lifestyle button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight) 
    Click Element    xpath=.//label[@for='tmreceived11']    
    Click lifestyle button
     Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight) 
    Select From List By Label    xpath=.//select[@name='treatmentOutcome11']    Fully Cured
    Click lifestyle button
    
Click lifestyle button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight) 
    Click Element    xpath=.//input[@id='addmedicalinfosubmit']                     
    
         
   
*** Test Cases ***
    
2 Adult STP-Sum Insured 2 lakhs
    [Documentation]    Sum Insured 2 lakhs
    Jenkins browser launch
    # Local browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')]
    Proposer Mobile Number
    Proposer email
    Select Second Adult
    Select Sum Insured for STP 2 lakh
    Click the Continue button
    Click the next button
    Select From List By Label    insurerDetails[1][relationshipWithProposer]    Spouse 
    Input Text    id=prospername2    Insured Member Two  
    Click Element    xpath=.//input[@id='eldestdate2']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Get Quote ID
    Click contact details button
    Input Text    id=lastName    Michel
    Click contact details button
    Sleep    2s    
    Click Element    xpath=.//*[@for='proposergendermale']          
    Click contact details button
    Input Text      id=panNo    EXXPS8896F
    Click contact details button
    Click Insured details button
    Input Text    id=address1    ADDRESS 1
    Click Insured details button    
    Input Text    id=address2    ADDRESS 2
    Click Insured details button 
    Input Text    xpath=.//input[@id='contactCity']    CHENNAI
    Click Insured details button
    Click Insured details button
    Input Text    id=pinCode    600045 
    Click Insured details button 
    Click MEDICAL QUESTIONS button 
    Input Text    xpath=.//input[@name='height1']    150
    Input Text    xpath=.//input[@name='weight1']    60 
    Click MEDICAL QUESTIONS button 
    Input Text    name=insuredLastName2    Insured last name
    Click MEDICAL QUESTIONS button
    Click Element    xpath=.//*[@for='insuredgenderfemale2']
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height2']    150
    Input Text    xpath=.//input[@name='weight2']    60 
    Click MEDICAL QUESTIONS button 
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='consultedDoctorno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='undergoneinvestno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='omtreatno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tmdregularno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='mcnotseendocno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='sufferedno']
    Click ADDITIONAL MEDICAL INFORMATION button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='consultedDoctorno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='undergoneinvestno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='omtreatno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tmdregularno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='mcnotseendocno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='sufferedno2']
    Click ADDITIONAL MEDICAL INFORMATION button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='alcoholno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='smokingno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tgpno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='narcoticsno']
    Click GENERAL INFORMATION button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='alcoholno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='smokingno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tgpno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='narcoticsno2']
    Click GENERAL INFORMATION button 
    Click PAYMENT DETAILS button
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Select From List By Label    relationWithProposer    Brother
    Click PAYMENT DETAILS button
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    name=nomineeFirstName    text  
    Click PAYMENT DETAILS button  
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    name=nomineeLastName    text 
    Click PAYMENT DETAILS button 
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)  
    Click Element    xpath=.//input[@id='nomineeDob'] 
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')] 
    Click PAYMENT DETAILS button
    Input Text    name=nomineeMobileNumber    ${MobileNumber} 
    Click PAYMENT DETAILS button
    Handle OTP Alert message 
    Handle declaration and Terms and Condition
    Handle Payment Details
    Close Browser
         
2 Adult NON-STP-Sum Insured 3 lakhs
    [Documentation]    Sum Insured 3 lakhs
    # Local browser launch
    Jenkins browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')]
    Proposer Mobile Number
    Proposer email
    Select Second Adult
    Select Sum Insured for STP 3 lakh
    Click the Continue button
    Click the next button
    Select From List By Label    insurerDetails[1][relationshipWithProposer]    Spouse 
    Input Text    id=prospername2    Insured Member Two  
    Click Element    xpath=.//input[@id='eldestdate2']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Click contact details button
    Input Text    id=lastName    Michel
    Click contact details button
    Sleep    2s    
    Click Element    xpath=.//*[@for='proposergendermale']          
    Click contact details button
    Input Text      id=panNo    EXXPS8896F
    Click contact details button
    Click Insured details button
    Input Text    id=address1    ADDRESS 1
    Click Insured details button    
    Input Text    id=address2    ADDRESS 2
    Click Insured details button 
    Input Text    xpath=.//input[@id='contactCity']    CHENNAI
    Click Insured details button
    Click Insured details button
    Input Text    id=pinCode    600045 
    Click Insured details button 
    Click MEDICAL QUESTIONS button 
    Input Text    xpath=.//input[@name='height1']    150
    Input Text    xpath=.//input[@name='weight1']     60
    Click MEDICAL QUESTIONS button 
    Input Text    name=insuredLastName2    Insured last name
    Click MEDICAL QUESTIONS button
    Click Element    xpath=.//*[@for='insuredgenderfemale2']
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height2']    150
    Input Text    xpath=.//input[@name='weight2']    61
    Click MEDICAL QUESTIONS button 
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='consultedDoctorno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='undergoneinvestno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='omtreatno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tmdregularno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='mcnotseendocno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='sufferedno']
    Click ADDITIONAL MEDICAL INFORMATION button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='consultedDoctorno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='undergoneinvestno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='omtreatno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tmdregularno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='mcnotseendocno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='sufferedno2']
    Click ADDITIONAL MEDICAL INFORMATION button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='alcoholno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='smokingno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tgpno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='narcoticsno']
    Click GENERAL INFORMATION button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='alcoholno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='smokingno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tgpno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='narcoticsno2']
    Click GENERAL INFORMATION button
    Click PAYMENT DETAILS button
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Select From List By Label    relationWithProposer    Brother
    Click PAYMENT DETAILS button
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    name=nomineeFirstName    text  
    Click PAYMENT DETAILS button  
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    name=nomineeLastName    text 
    Click PAYMENT DETAILS button 
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)  
    Click Element    xpath=.//input[@id='nomineeDob'] 
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')] 
    Click PAYMENT DETAILS button
    Input Text    name=nomineeMobileNumber    ${MobileNumber} 
    Click PAYMENT DETAILS button
    Handle OTP Alert message 
    Handle declaration and Terms and Condition
    Handle Payment Details
    Close Browser
       
2 Adult STP-Proposer Age 36
    [Documentation]    Proposer Age-36
    # Local browser launch
    Jenkins browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1984
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'15')]
    Proposer Mobile Number
    Proposer email
    Select Second Adult
    Select Sum Insured for STP 2 lakh
    Click the Continue button
    Click the next button
    Select From List By Label    insurerDetails[1][relationshipWithProposer]    Son 
    Input Text    id=prospername2    Insured Member Two  
    Click Element    xpath=.//input[@id='eldestdate2']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2001      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Click contact details button
    Input Text    id=lastName    Michel
    Click contact details button
    Sleep    2s    
    Click Element    xpath=.//*[@for='proposergendermale']          
    Click contact details button
    Input Text      id=panNo    EXXPS8896F
    Click contact details button
    Click Insured details button
    Input Text    id=address1    ADDRESS 1
    Click Insured details button    
    Input Text    id=address2    ADDRESS 2
    Click Insured details button 
    Input Text    xpath=.//input[@id='contactCity']    CHENNAI
    Click Insured details button
    Click Insured details button
    Input Text    id=pinCode    600045 
    Click Insured details button 
    Click MEDICAL QUESTIONS button 
    Input Text    xpath=.//input[@name='height1']    150
    Input Text    xpath=.//input[@name='weight1']     60
    Sleep    10s    
    Click MEDICAL QUESTIONS button 
    Input Text    name=insuredLastName2    Insured last name
    Click MEDICAL QUESTIONS button
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//*[@for='insuredgendermale2']
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height2']    150
    Input Text    xpath=.//input[@name='weight2']    60 
    Click MEDICAL QUESTIONS button 
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='consultedDoctorno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='undergoneinvestno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='omtreatno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tmdregularno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='mcnotseendocno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='sufferedno']
    Click ADDITIONAL MEDICAL INFORMATION button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='consultedDoctorno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='undergoneinvestno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='omtreatno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tmdregularno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='mcnotseendocno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='sufferedno2']
    Click ADDITIONAL MEDICAL INFORMATION button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='alcoholno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='smokingno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tgpno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='narcoticsno']
    Click GENERAL INFORMATION button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='alcoholno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='smokingno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tgpno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='narcoticsno2']
    Click GENERAL INFORMATION button
    Click PAYMENT DETAILS button
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Select From List By Label    relationWithProposer    Brother
    Click PAYMENT DETAILS button
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    name=nomineeFirstName    text  
    Click PAYMENT DETAILS button  
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    name=nomineeLastName    text 
    Click PAYMENT DETAILS button 
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)  
    Click Element    xpath=.//input[@id='nomineeDob'] 
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')] 
    Click PAYMENT DETAILS button
    Input Text    name=nomineeMobileNumber    ${MobileNumber} 
    Click PAYMENT DETAILS button
    Handle OTP Alert message 
    Handle declaration and Terms and Condition
    Handle Payment Details
        
2 Adult NON-STP-Proposer Age 36
    [Documentation]    Medical Question is Yes
    Local browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1984
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'15')]
    Proposer Mobile Number
    Proposer email
    Select Second Adult
    Select Sum Insured for STP 2 lakh
    Click the Continue button
    Click the next button
    Select From List By Label    insurerDetails[1][relationshipWithProposer]    Daughter 
    Input Text    id=prospername2    Insured Member Two  
    Click Element    xpath=.//input[@id='eldestdate2']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2001      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Click contact details button
    Input Text    id=lastName    Michel
    Click contact details button
    Sleep    2s    
    Click Element    xpath=.//*[@for='proposergendermale']          
    Click contact details button
    Input Text      id=panNo    EXXPS8896F
    Click contact details button
    Click Insured details button
    Input Text    id=address1    ADDRESS 1
    Click Insured details button    
    Input Text    id=address2    ADDRESS 2
    Click Insured details button 
    Input Text    xpath=.//input[@id='contactCity']    CHENNAI
    Click Insured details button
    Click Insured details button
    Input Text    id=pinCode    600045 
    Click Insured details button 
    Click MEDICAL QUESTIONS button 
    Input Text    xpath=.//input[@name='height1']    150
    Input Text    xpath=.//input[@name='weight1']     60
    Sleep    10s    
    Click MEDICAL QUESTIONS button 
    Input Text    name=insuredLastName2    Insured last name
    Click MEDICAL QUESTIONS button
    Sleep    5s    
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//*[@for='insuredgenderfemale2']
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height2']    150
    Input Text    xpath=.//input[@name='weight2']    60 
    Click MEDICAL QUESTIONS button 
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='consultedDoctoryes']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='undergoneinvestno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='omtreatno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tmdregularno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='mcnotseendocno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='sufferedno']
    Click ADDITIONAL MEDICAL INFORMATION button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight) 
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='consultedDoctorno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='undergoneinvestno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='omtreatno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tmdregularno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='mcnotseendocno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='sufferedno2']
    Click ADDITIONAL MEDICAL INFORMATION button
    Medical yes
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='alcoholno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='smokingno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tgpno']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='narcoticsno']
    Click GENERAL INFORMATION button
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='alcoholno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='smokingno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tgpno2']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='narcoticsno2']
    Click GENERAL INFORMATION button
    Click PAYMENT DETAILS button
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Select From List By Label    relationWithProposer    Brother
    Click PAYMENT DETAILS button
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    name=nomineeFirstName    text  
    Click PAYMENT DETAILS button  
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    name=nomineeLastName    text 
    Click PAYMENT DETAILS button 
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)  
    Click Element    xpath=.//input[@id='nomineeDob'] 
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')] 
    Click PAYMENT DETAILS button
    Input Text    name=nomineeMobileNumber    ${MobileNumber} 
    Click PAYMENT DETAILS button
    Handle OTP Alert message 
    Handle declaration and Terms and Condition
    Handle Payment Details
        

    
2 Adult and 1 Child with STP
    Jenkins browser launch
    # Local browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1991
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'15')]
    Proposer Mobile Number
    Proposer email
    Select Second Adult
    Select First child
    Select Sum Insured for STP 2 lakh
    Click the Continue button
    Click the next button
    Select From List By Label    insurerDetails[1][relationshipWithProposer]    Father 
    Input Text    id=prospername2    Insured Member Two  
    Click Element    xpath=.//input[@id='eldestdate2']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1979    
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'20')] 
    Click the next button 
    Sleep    5s 
    Select From List By Label    insurerDetails[2][relationshipWithProposer]    Son 
    Input Text    id=prospername3    Insured Member Three  
    Click Element    xpath=.//input[@id='eldestdate3']   
    Select From List By Label    xpath=.//select[@class='ui-datepicker-month']    Jan    
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'15')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Close Browser
    
2 Adult and 1 Child with NON-STP
    # Local browser launch
    Jenkins browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1991
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'15')]
    Proposer Mobile Number
    Proposer email
    Select Second Adult
    Select First child
    Select Sum Insured for STP 2 lakh
    Click the Continue button
    Click the next button
    Select From List By Label    insurerDetails[1][relationshipWithProposer]    Mother
    Input Text    id=prospername2    Insured Member Two  
    Click Element    xpath=.//input[@id='eldestdate2']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1979    
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'20')] 
    Click the next button 
    Sleep    5s 
    Select From List By Label    insurerDetails[2][relationshipWithProposer]    Son 
    Input Text    id=prospername3    Insured Member Three  
    Click Element    xpath=.//input[@id='eldestdate3']   
    Select From List By Label    xpath=.//select[@class='ui-datepicker-month']    Jan    
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'15')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Close Browser
    
2 Adult and 2 Child NON-STP
    # Local browser launch
    Jenkins browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1953
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Proposer Mobile Number
    Proposer email
    Select Second Adult
    Select Second child
    Select Sum Insured for STP 1.5 lakh
    Click the Continue button
    Select From List By Label    xpath=.//div[@class='form-group citynameicn']//select[@id='relationShipProposer1']    Spouse
    Input Text    id=prospername1    Maya
    Click Element    id=eldestdate1
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1965
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    Select From List By Label    insurerDetails[1][relationshipWithProposer]    Son
    Input Text    id=prospername2    Insured Member Two  
    Click Element    xpath=.//input[@id='eldestdate2']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1997    
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')] 
    Click the next button 
    Sleep    3s 
    Select From List By Label    insurerDetails[2][relationshipWithProposer]    Son 
    Input Text    id=prospername3    Insured Member Three  
    Click Element    xpath=.//input[@id='eldestdate3']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2003    
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button 
    Select From List By Label    insurerDetails[3][relationshipWithProposer]    Daughter 
    Input Text    id=prospername4    Insured Member Four
    Click Element    xpath=.//input[@id='eldestdate4']
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2019 
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Close Browser
    
3 Adult STP
    Jenkins browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1952
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Proposer Mobile Number
    Proposer email
    Select Third Adult
    Select Sum Insured for STP 2 lakh
    Click the Continue button
    Select From List By Label    xpath=.//div[@class='form-group citynameicn']//select[@id='relationShipProposer1']    Spouse
    Input Text    id=prospername1    Maya
    Click Element    id=eldestdate1
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1975
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    Select From List By Label    xpath=.//div[@class='form-group citynameicn']//select[@id='relationShipProposer2']    Son
    Input Text    id=prospername2    Kim
    Click Element    id=eldestdate2
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1999
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    Select From List By Label    xpath=.//div[@class='form-group citynameicn']//select[@id='relationShipProposer3']    Daughter
    Input Text    id=prospername3    Niya
    Click Element    id=eldestdate3
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    2002
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Close Browser
    
4 Adult STP
    # Local browser launch
    Jenkins browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Proposer Mobile Number
    Proposer email
    Select Fourth Adult
    Select Sum Insured for STP 1 lakh
    Click the Continue button
    Click the next button
    Select From List By Label    insurerDetails[1][relationshipWithProposer]    Father 
    Input Text    id=prospername2    Insured Member Two  
    Click Element    xpath=.//input[@id='eldestdate2']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1975      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    Select From List By Label    insurerDetails[2][relationshipWithProposer]    Spouse 
    Input Text    id=prospername3    Insured Member Three 
    Click Element    xpath=.//input[@id='eldestdate3']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    Select From List By Label    insurerDetails[3][relationshipWithProposer]    Son 
    Input Text    id=prospername4    Insured Member Four 
    Click Element    xpath=.//input[@id='eldestdate4']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2002      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Close Browser
    
5 Adult NON-STP
    # Local browser launch
    Jenkins browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1982    
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Proposer Mobile Number
    Proposer email
    Select Fifth Adult
    Select Sum Insured for STP 2.5 lakh
    Click the Continue button
    Click the next button
    Select From List By Label    insurerDetails[1][relationshipWithProposer]    Father 
    Input Text    id=prospername2    Insured Member Two  
    Click Element    xpath=.//input[@id='eldestdate2']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1959      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    Select From List By Label    insurerDetails[2][relationshipWithProposer]    Mother 
    Input Text    id=prospername3    Insured Member Three 
    Click Element    xpath=.//input[@id='eldestdate3']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1962      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    Select From List By Label    insurerDetails[3][relationshipWithProposer]    Spouse 
    Input Text    id=prospername4    Insured Member Four 
    Click Element    xpath=.//input[@id='eldestdate4']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1983      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    Select From List By Label    insurerDetails[4][relationshipWithProposer]    Father in law 
    Input Text    id=prospername5    Insured Member Fifth 
    Click Element    xpath=.//input[@id='eldestdate5']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1965      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Close Browser
    
    

    


    
    
    

    
    
    

    

    
    
    
    

