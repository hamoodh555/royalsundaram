*** Settings ***
Library    SeleniumLibrary 

*** Variables ***
${Baseurl}    http://10.100.20.34:9190/web/guest/asquote
${Prospername}    John
${MobileNumber}  9442189256
${EmailID}    qcteam1@xerago.mail
${Lastname}    Mike

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
    Set Selenium Speed    0.5s
    Open Browser     ${Baseurl}    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    15s
Choose the Cover Type
    Click Element    xpath=.//div[@class='familyfloaterRadio coverageradio bigradiobutton']
    
Name of Proposer
     Input Text    id=prospername    ${Prospername}
     
Proposer DOB
     Click Element    xpath=.//input[@id='individualDOB']
     
Proposer Mobile Number
    Input Text    id=prospermobileno    ${MobileNumber}
    
Proposer email
    Input Text    id=prosperemail    ${EmailID}
    
Select Second Adult
    Click Element   xpath=.//ul[@class='familylist adults']//li[2]
    
Select Sum Insured for STP 2 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[3]
    
Select Sum Insured for STP 3 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[5]
    
Click the Continue button
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='familycombinationCont']
    
Click the next button  
    Sleep    2s      
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='insurenext'] 
    
Insured Member 1 for Second Test Case
    Select From List By Label    insurerDetails[1][relationshipWithProposer]    Spouse 
    Input Text    id=prospername2    Insured Member Two  
    Click Element    xpath=.//input[@id='eldestdate2']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')]
    
Insured Member 2 for Second Test Case 
    Select From List By Label    insurerDetails[1][relationshipWithProposer]    Spouse 
    Input Text    id=prospername2    Insured Member Two  
    Click Element    xpath=.//input[@id='eldestdate2']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2001      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')]
    
    
Click the Premium detail button
    Click Element    id=cityCont1
    
Click the proceed button in Premium Details Page
    Sleep    4s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@id='proceed']
    
Click the Proceed button in model pop
     Sleep    2s
     SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
     Click Element    xpath=.//div[@class='modal-content']//button[@id='closeproceed']
    
    
        

*** Test Cases ***
2 Adult STP-Sum Insured 2 lakhs
    [Documentation]    Sum Insured 2 lakhs
    Local browser launch
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
    Insured Member 1 for Second Test Case
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Close Browser
    
2 Adult NON-STP-Sum Insured 3 lakhs
    [Documentation]    Sum Insured 3 lakhs
    Local browser launch
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
    Insured Member 1 for Second Test Case
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Close Browser
    
2 Adult STP-Proposer Age 36
    [Documentation]    Proposer Age-30
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
    Insured Member 2 for Second Test Case
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Close Browser
    
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
    Insured Member 2 for Second Test Case
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Close Browser
    
    
    
    

    
    
    

    

    
    
    
    

