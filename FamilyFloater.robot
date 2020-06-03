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
    # Maximize Browser Window
    Set Window Size    1024    768    
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
    
Select Fourth Child
    Click Element    xpath=.//ul[@class='familylist children']//li[4] 
    
Select Fifth Child
    Click Element    xpath=.//ul[@class='familylist children']//li[5] 
              
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
    
Select Sum Insured for STP 3.5 lakh
    Click Element    xpath=.//div[@id='planyears']//ul//li[6]
    
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
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    xpath=.//input[@id='mobileOTP']    ${OTP}
    Sleep    3s
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
    
Call Sleep
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)                 
    
         
   
*** Test Cases ***

NSTP-Family Floater with 5 Adults and 5 Child with age above 51 and Sum Insured above 2.5 Lakhs
    Jenkins browser launch
    # Local browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1981
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')]
    Proposer Mobile Number
    Proposer email
    Select Fifth Adult
    Call Sleep
    Select Fifth Child
    Select Sum Insured for STP 3.5 lakh
    Click the Continue button
    Click the next button
    Select From List By Label    insurerDetails[1][relationshipWithProposer]    Spouse 
    Input Text    id=prospername2    Insured Member Two  
    Click Element    xpath=.//input[@id='eldestdate2']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1983      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')]
    
    Click the next button
    Sleep    3s 
    Select From List By Label    insurerDetails[2][relationshipWithProposer]    Father 
    Input Text    id=prospername3    Insured Member Three  
    Click Element    xpath=.//input[@id='eldestdate3']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1959    
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    
    Select From List By Label    insurerDetails[3][relationshipWithProposer]    Father in Law 
    Input Text    id=prospername4    Insured Member Four
    Click Element    xpath=.//input[@id='eldestdate4']
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1956 
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    
    Select From List By Label    insurerDetails[4][relationshipWithProposer]    Mother 
    Input Text    id=prospername5    Insured Member Fifth
    Click Element    xpath=.//input[@id='eldestdate5']
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1963 
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    
    Select From List By Label    insurerDetails[5][relationshipWithProposer]    Son 
    Input Text    id=prospername6    Insured Member sixth
    Click Element    xpath=.//input[@id='eldestdate6']
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2008 
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    
    Select From List By Label    insurerDetails[6][relationshipWithProposer]    Son
    Input Text    id=prospername7    Insured Member Seventh
    Click Element    xpath=.//input[@id='eldestdate7']
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2009
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    
    Select From List By Label    insurerDetails[7][relationshipWithProposer]    Son
    Input Text    id=prospername8    Insured Member eighth
    Click Element    xpath=.//input[@id='eldestdate8']
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2011
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    
    Select From List By Label    insurerDetails[8][relationshipWithProposer]    Daughter
    Input Text    id=prospername9    Insured Member ninth
    Click Element    xpath=.//input[@id='eldestdate9']
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2017
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    
    Select From List By Label    insurerDetails[9][relationshipWithProposer]    Daughter
    Input Text    id=prospername10    Insured Member Tenth
    Click Element    xpath=.//input[@id='eldestdate10']
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2018
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    
    Get Quote ID
    Click contact details button
    Call Sleep
    Click Element    xpath=.//label[@for='coveredAllChildYes'] 
    Click contact details button
    Input Text    id=lastName    Proposer Lastname
    Click contact details button
    Call Sleep
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
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName2']    adult two lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgenderfemale2'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height2']    150
    Input Text    xpath=.//input[@name='weight2']    60
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName3']    adult Three lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale3'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height3']    150
    Input Text    xpath=.//input[@name='weight3']    60
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName4']    adult Four lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale4'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height4']    100
    Input Text    xpath=.//input[@name='weight4']    100
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName5']    adult Fifth lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgenderfemale5'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height5']    150
    Input Text    xpath=.//input[@name='weight5']    60
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName6']    Child One lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale6'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height6']    150
    Input Text    xpath=.//input[@name='weight6']    60
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName7']    Child Two lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale7'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height7']    150
    Input Text    xpath=.//input[@name='weight7']    60
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName8']    Child Three lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale8'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height8']    150
    Input Text    xpath=.//input[@name='weight8']    60
    Click MEDICAL QUESTIONS button
        
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName9']    Child Four lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgenderfemale9'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height9']    150
    Input Text    xpath=.//input[@name='weight9']    60
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName10']    Child Five lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgenderfemale10'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height10']    150
    Input Text    xpath=.//input[@name='weight10']    60
    Click MEDICAL QUESTIONS button
    
     Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno']
    Click ADDITIONAL MEDICAL INFORMATION button
    
     Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno2']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno2']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno2']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno2']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno2']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno2']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno3']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno3']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno3']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno3']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno3']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno3']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno4']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno4']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno4']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno4']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno4']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno4']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno5']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno5']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno5']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno5']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno5']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno5']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno6']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno6']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno6']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno6']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno6']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno6']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno7']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno7']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno7']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno7']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno7']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno7']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno8']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno8']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno8']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno8']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno8']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno8']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno9']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno9']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno9']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno9']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno9']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno9']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno10']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno10']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno10']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno10']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno10']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno10']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno2']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno2']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno2']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno2']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno3']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno3']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno3']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno3']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno4']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno4']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno4']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno4']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno5']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno5']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno5']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno5']
    Click GENERAL INFORMATION button
    
    Click PAYMENT DETAILS button
    Call Sleep
    Select From List By Label    relationWithProposer    Brother
    Click PAYMENT DETAILS button
    Call Sleep
    Input Text    name=nomineeFirstName    text  
    Click PAYMENT DETAILS button
    Call Sleep
    Input Text    name=nomineeLastName    text 
    Click PAYMENT DETAILS button
    Call Sleep
    Click Element    xpath=.//input[@id='nomineeDob'] 
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')] 
    Click PAYMENT DETAILS button
    Handle OTP Alert message
    Handle declaration and Terms and Condition
    Handle Payment Details
    Close Browser
    
NSTP-Family Floater with 3 Adults and 4 Child with Medical Question as Yes and BMI above 33
    Jenkins browser launch
    # Local browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1989
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')]
    Proposer Mobile Number
    Proposer email
    Select Third Adult
    Call Sleep
    Select Fourth Child
    Select Sum Insured for STP 1 lakh
    Click the Continue button
    Click the next button
    Select From List By Label    insurerDetails[1][relationshipWithProposer]    Spouse 
    Input Text    id=prospername2    Insured Member Two  
    Click Element    xpath=.//input[@id='eldestdate2']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1991      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')]
    
    
    Click the next button
    Sleep    3s 
    Select From List By Label    insurerDetails[2][relationshipWithProposer]    Father in Law 
    Input Text    id=prospername3    Insured Member Three  
    Click Element    xpath=.//input[@id='eldestdate3']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1971    
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
     
    Select From List By Label    insurerDetails[3][relationshipWithProposer]    Son 
    Input Text    id=prospername4    Insured Member Four
    Click Element    xpath=.//input[@id='eldestdate4']
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2003 
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    
    Select From List By Label    insurerDetails[4][relationshipWithProposer]    Son 
    Input Text    id=prospername5    Insured Member Fifth
    Click Element    xpath=.//input[@id='eldestdate5']
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2007 
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    
    Select From List By Label    insurerDetails[5][relationshipWithProposer]    Daughter 
    Input Text    id=prospername6    Insured Member sixth
    Click Element    xpath=.//input[@id='eldestdate6']
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2011 
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    
    Select From List By Label    insurerDetails[6][relationshipWithProposer]    Daughter 
    Input Text    id=prospername7    Insured Member Seventh
    Click Element    xpath=.//input[@id='eldestdate7']
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    2017
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    
    Get Quote ID
    Click contact details button
    Call Sleep
    Click Element    xpath=.//label[@for='coveredAllChildYes'] 
    Click contact details button
    Input Text    id=lastName    Proposer Lastname
    Click contact details button
    Call Sleep
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
    Input Text    xpath=.//input[@name='height1']    100
    Input Text    xpath=.//input[@name='weight1']    100 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName2']    adult two lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgenderfemale2'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height2']    100
    Input Text    xpath=.//input[@name='weight2']    100 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName3']    adult Three lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale3'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height3']    100
    Input Text    xpath=.//input[@name='weight3']    100
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName4']    Child one lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale4'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height4']    100
    Input Text    xpath=.//input[@name='weight4']    100
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName5']     Child two lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale5'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height5']    100
    Input Text    xpath=.//input[@name='weight5']    100 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName6']    Child three lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgenderfemale6'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height6']    100
    Input Text    xpath=.//input[@name='weight6']    100 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName7']    Child four lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgenderfemale7'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height7']    100
    Input Text    xpath=.//input[@name='weight7']    100 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno']
    Click ADDITIONAL MEDICAL INFORMATION button
    
     Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno2']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno2']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno2']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno2']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno2']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno2']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno3']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno3']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno3']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno3']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno3']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno3']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno4']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno4']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno4']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno4']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno4']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno4']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno5']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno5']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno5']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno5']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno5']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno5']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno6']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno6']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno6']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno6']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno6']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno6']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno7']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno7']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno7']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno7']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno7']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno7']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno2']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno2']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno2']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno2']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno3']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno3']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno3']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno3']
    Click GENERAL INFORMATION button
    
    Click PAYMENT DETAILS button
    Call Sleep
    Select From List By Label    relationWithProposer    Brother
    Click PAYMENT DETAILS button
    Call Sleep
    Input Text    name=nomineeFirstName    text  
    Click PAYMENT DETAILS button
    Call Sleep
    Input Text    name=nomineeLastName    text 
    Click PAYMENT DETAILS button
    Call Sleep
    Click Element    xpath=.//input[@id='nomineeDob'] 
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')] 
    Click PAYMENT DETAILS button
    Handle OTP Alert message
    Handle declaration and Terms and Condition
    Handle Payment Details
    Close Browser
    
   
NSTP-Family Floater with 2 Adults and 2 Child with age above 51
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
    Call Sleep
    Select Second child
    Select Sum Insured for STP 1.5 lakh
    Click the Continue button
    Select From List By Label    xpath=.//div[@class='form-group citynameicn']//select[@id='relationShipProposer1']    Spouse
    Input Text    id=prospername1    Maya
    Call Sleep
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
    
    Get Quote ID
    Click contact details button
    Call Sleep
    Click Element    xpath=.//label[@for='coveredAllChildYes'] 
    Click contact details button
    Input Text    id=lastName    Proposer Lastname
    Click contact details button
    Call Sleep
    Click Element    xpath=.//*[@for='proposergenderfemale']          
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
    Input Text    xpath=.//input[@name='insuredLastName1']    Proposer Last name  
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale']
    Click MEDICAL QUESTIONS button
    Call Sleep
    Input Text    xpath=.//input[@name='height1']    150
    Input Text    xpath=.//input[@name='weight1']    60 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName2']    adult two lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale2'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height2']    150
    Input Text    xpath=.//input[@name='weight2']    60 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName3']    adult Three lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale3'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height3']    150
    Input Text    xpath=.//input[@name='weight3']    60 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName4']    adult Four lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgenderfemale4'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height4']    150
    Input Text    xpath=.//input[@name='weight4']    60 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno']
    Click ADDITIONAL MEDICAL INFORMATION button
    
     Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno2']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno2']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno2']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno2']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno2']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno2']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno3']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno3']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno3']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno3']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno3']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno3']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno4']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno4']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno4']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno4']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno4']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno4']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno2']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno2']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno2']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno2']
    Click GENERAL INFORMATION button
    
    Click PAYMENT DETAILS button
    Call Sleep
    Select From List By Label    relationWithProposer    Brother
    Click PAYMENT DETAILS button
    Call Sleep
    Input Text    name=nomineeFirstName    text  
    Click PAYMENT DETAILS button
    Call Sleep
    Input Text    name=nomineeLastName    text 
    Click PAYMENT DETAILS button
    Call Sleep
    Click Element    xpath=.//input[@id='nomineeDob'] 
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')] 
    Click PAYMENT DETAILS button
    Handle OTP Alert message
    Handle declaration and Terms and Condition
    Handle Payment Details
    Close Browser
    
NSTP-Family Floater with 5 Adults with age above 51
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
    Call Sleep
    Select From List By Label    xpath=.//select[@name='insurerDetails[4][relationshipWithProposer]']    Father in Law
    Input Text    id=prospername5    Insured Member Fifth
    Call Sleep
    Click Element    xpath=.//input[@id='eldestdate5']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1965      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    
    Get Quote ID
    Click contact details button
    Input Text    id=lastName    Michel
    Click contact details button
    Call Sleep
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
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName2']    adult two lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale2'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height2']    150
    Input Text    xpath=.//input[@name='weight2']    60 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName3']    adult Three lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgenderfemale3'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height3']    150
    Input Text    xpath=.//input[@name='weight3']    60 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName4']    adult Four lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgenderfemale4'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height4']    150
    Input Text    xpath=.//input[@name='weight4']    60 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName5']    adult Fifth lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale5'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height5']    150
    Input Text    xpath=.//input[@name='weight5']    60 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno2']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno2']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno2']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno2']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno2']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno2']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno3']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno3']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno3']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno3']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno3']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno3']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno4']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno4']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno4']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno4']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno4']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno4']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno5']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno5']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno5']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno5']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno5']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno5']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno2']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno2']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno2']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno2']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno3']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno3']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno3']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno3']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno4']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno4']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno4']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno4']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno5']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno5']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno5']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno5']
    Click GENERAL INFORMATION button
    
    Click PAYMENT DETAILS button
    Call Sleep
    Select From List By Label    relationWithProposer    Brother
    Click PAYMENT DETAILS button
    Call Sleep
    Input Text    name=nomineeFirstName    text  
    Click PAYMENT DETAILS button
    Call Sleep
    Input Text    name=nomineeLastName    text 
    Click PAYMENT DETAILS button
    Call Sleep
    Click Element    xpath=.//input[@id='nomineeDob'] 
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')] 
    Click PAYMENT DETAILS button
    Handle OTP Alert message
    Handle declaration and Terms and Condition
    Handle Payment Details
    Close Browser
      
STP-Family Floater with 4 Adults
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
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    
    Get Quote ID
    Click contact details button
    Input Text    id=lastName    Michel
    Click contact details button
    Call Sleep
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
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName2']    adult two lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale2'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height2']    150
    Input Text    xpath=.//input[@name='weight2']    60 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName3']    adult threee lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgenderfemale3'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height3']    150
    Input Text    xpath=.//input[@name='weight3']    60 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName4']    adult Four lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale4'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height4']    150
    Input Text    xpath=.//input[@name='weight4']    60 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno']
    Click ADDITIONAL MEDICAL INFORMATION button
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno2']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno2']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno2']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno2']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno2']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno2']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno3']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno3']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno3']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno3']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno3']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno3']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno4']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno4']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno4']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno4']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno4']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno4']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno2']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno2']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno2']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno2']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno3']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno3']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno3']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno3']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno4']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno4']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno4']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno4']
    Click GENERAL INFORMATION button
    
    Click PAYMENT DETAILS button
    Call Sleep
    Select From List By Label    relationWithProposer    Brother
    Click PAYMENT DETAILS button
    Call Sleep
    Input Text    name=nomineeFirstName    text  
    Click PAYMENT DETAILS button
    Call Sleep
    Input Text    name=nomineeLastName    text 
    Click PAYMENT DETAILS button
    Call Sleep
    Click Element    xpath=.//input[@id='nomineeDob'] 
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')] 
    Click PAYMENT DETAILS button
    Handle OTP Alert message
    Handle declaration and Terms and Condition
    Handle Payment Details
    Close Browser
    
      
STP-Family Floater with 3 Adults
    Jenkins browser launch
    # Local browser launch
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
    Call Sleep
    Click Element    xpath=.//input[@id='eldestdate1']
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1975
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    Select From List By Label    xpath=.//div[@class='form-group citynameicn']//select[@id='relationShipProposer2']    Son
    Input Text    id=prospername2    Kim
    Call Sleep
    Click Element    xpath=.//input[@id='eldestdate2']
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1999
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'22')]
    Click the next button
    Select From List By Label    xpath=.//div[@class='form-group citynameicn']//select[@id='relationShipProposer3']    Daughter
    Input Text    id=prospername3    Niya
    Call Sleep
    Click Element    xpath=.//input[@id='eldestdate3']
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    2002
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
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
     
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName1']    adult one lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgenderfemale'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height1']    150
    Input Text    xpath=.//input[@name='weight1']    60 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName2']    adult two lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale2'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height2']    150
    Input Text    xpath=.//input[@name='weight2']    60 
    Click MEDICAL QUESTIONS button
    

     
    Call Sleep
    Input Text    xpath=.//input[@name='insuredLastName3']    adult threee lastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgenderfemale3'] 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height3']    150
    Input Text    xpath=.//input[@name='weight3']    60 
    Click MEDICAL QUESTIONS button
    
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno']
    Click ADDITIONAL MEDICAL INFORMATION button
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno2']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno2']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno2']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno2']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno2']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno2']
    Click ADDITIONAL MEDICAL INFORMATION button
    Call Sleep
    Click Element    xpath=.//label[@for='consultedDoctorno3']
    Call Sleep
    Click Element    xpath=.//label[@for='undergoneinvestno3']
    Call Sleep
    Click Element    xpath=.//label[@for='omtreatno3']
    Call Sleep
    Click Element    xpath=.//label[@for='tmdregularno3']
    Call Sleep
    Click Element    xpath=.//label[@for='mcnotseendocno3']
    Call Sleep
    Click Element    xpath=.//label[@for='sufferedno3']
    Click ADDITIONAL MEDICAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno2']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno2']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno2']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno2']
    Click GENERAL INFORMATION button
    
    Call Sleep
    Click Element    xpath=.//label[@for='alcoholno3']
    Call Sleep
    Click Element    xpath=.//label[@for='smokingno3']
    Call Sleep
    Click Element    xpath=.//label[@for='tgpno3']
    Call Sleep
    Click Element    xpath=.//label[@for='narcoticsno3']
    Click GENERAL INFORMATION button
    
    Click PAYMENT DETAILS button
    Call Sleep
    Select From List By Label    relationWithProposer    Brother
    Click PAYMENT DETAILS button
    Call Sleep
    Input Text    name=nomineeFirstName    text  
    Click PAYMENT DETAILS button
    Call Sleep
    Input Text    name=nomineeLastName    text 
    Click PAYMENT DETAILS button
    Call Sleep
    Click Element    xpath=.//input[@id='nomineeDob'] 
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')] 
    Click PAYMENT DETAILS button
    Handle OTP Alert message
    Handle declaration and Terms and Condition
    Handle Payment Details
    Close Browser
    
STP-Family Floater with 2 Adults
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
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')] 
    Click PAYMENT DETAILS button
    Handle OTP Alert message
    Handle declaration and Terms and Condition
    Handle Payment Details
    Close Browser
    
         
NSTP-Family Floater with 2 Adults with Sum Insured above 2.5 Lakhs
    [Documentation]    Sum Insured 3 lakhs
    # Local browser launch
    Jenkins browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1993
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'2')]
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
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'2')]
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
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'2')] 
    Click PAYMENT DETAILS button
    Handle OTP Alert message
    Handle declaration and Terms and Condition
    Handle Payment Details
    Close Browser
       
STP-Family Floater with 2 Adults with Self and Son
    [Documentation]    Proposer Age-36
    # Local browser launch
    Jenkins browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1984
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
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
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'2')]
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
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'2')] 
    Click PAYMENT DETAILS button
    Handle OTP Alert message
    Handle declaration and Terms and Condition
    Handle Payment Details
        
NSTP-Family Floater with 2 Adults with Sum Insured above 2.5 Lakhs and Medical Question as Yes
    [Documentation]    Medical Question is Yes
    # Local browser launch
    Jenkins browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1984
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
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
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'2')]
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
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'2')] 
    Click PAYMENT DETAILS button
    Handle OTP Alert message
    Handle declaration and Terms and Condition
    Handle Payment Details
            
STP-Family Floater with 2 Adults and 1 Child
    Jenkins browser launch
    # Local browser launch
    Choose the Cover Type
    Name of Proposer
    Proposer DOB
    Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1991
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Proposer Mobile Number
    Proposer email
    Select Second Adult
    Call Sleep
    Select First child
    Select Sum Insured for STP 2 lakh
    Click the Continue button
    Click the next button
    Select From List By Label    insurerDetails[1][relationshipWithProposer]    Father 
    Input Text    id=prospername2    Insured Member Two  
    Click Element    xpath=.//input[@id='eldestdate2']   
    Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1979    
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'2')] 
    Click the next button
    Sleep    5s 
    Select From List By Label    insurerDetails[2][relationshipWithProposer]    Son 
    Input Text    id=prospername3    Insured Member Three  
    Click Element    xpath=.//input[@id='eldestdate3']   
    Select From List By Label    xpath=.//select[@class='ui-datepicker-month']    Jan    
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'1')]
    Click the Premium detail button
    Click the proceed button in Premium Details Page
    Click the Proceed button in model pop
    Get Quote ID
    Click contact details button
    Call Sleep
    Click Element    xpath=.//label[@for='coveredAllChildYes'] 
    Click contact details button
    Input Text    id=lastName    Proposer Lastname
    Click contact details button
    Call Sleep
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
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale2']
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='height2']    150
    Input Text    xpath=.//input[@name='weight2']    60 
    Click MEDICAL QUESTIONS button
    Input Text    xpath=.//input[@name='insuredLastName3']    InsuredThreeLastname
    Click MEDICAL QUESTIONS button
    Call Sleep
    Click Element    xpath=.//*[@for='insuredgendermale3'] 
    Click MEDICAL QUESTIONS button
    Call Sleep
    Input Text    xpath=.//input[@name='height3']    150
    Input Text    xpath=.//input[@name='weight3']    60 
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
    Click Element    xpath=.//label[@for='consultedDoctorno3']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='undergoneinvestno3']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='omtreatno3']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='tmdregularno3']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='mcnotseendocno3']
    Sleep    1s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//label[@for='sufferedno3']
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
    Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'2')] 
    Click PAYMENT DETAILS button
    Handle OTP Alert message
    Handle declaration and Terms and Condition
    Handle Payment Details
       
# NSTP-Family Floater with 2 Adults and 1 Child with Cover all Child as No
    # # Local browser launch
    # Jenkins browser launch
    # Choose the Cover Type
    # Name of Proposer
    # Proposer DOB
    # Select From List By Value     xpath=.//select[@class='ui-datepicker-year']    1991
    # Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'15')]
    # Proposer Mobile Number
    # Proposer email
    # Select Second Adult
    # Select First child
    # Select Sum Insured for STP 2 lakh
    # Click the Continue button
    # Click the next button
    # Select From List By Label    insurerDetails[1][relationshipWithProposer]    Mother
    # Input Text    id=prospername2    Insured Member Two  
    # Click Element    xpath=.//input[@id='eldestdate2']   
    # Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1979    
    # Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'20')] 
    # Click the next button
    # Sleep    5s 
    # Select From List By Label    insurerDetails[2][relationshipWithProposer]    Son 
    # Input Text    id=prospername3    Insured Member Three  
    # Click Element    xpath=.//input[@id='eldestdate3']   
    # Select From List By Label    xpath=.//select[@class='ui-datepicker-month']    Jan    
    # Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'15')]
    # Click the Premium detail button
    # Click the proceed button in Premium Details Page
    # Click the Proceed button in model pop
    # Get Quote ID
    # Click contact details button
    # Call Sleep
    # Click Element    xpath=.//label[@for='coveredAllChildNo'] 
    # Click contact details button
    # Input Text    id=lastName    Proposer Lastname
    # Click contact details button
    # Call Sleep
    # Click Element    xpath=.//*[@for='proposergendermale']          
    # Click contact details button
    # Input Text      id=panNo    EXXPS8896F
    # Click contact details button
    # Click Insured details button
    # Input Text    id=address1    ADDRESS 1
    # Click Insured details button
    # Input Text    id=address2    ADDRESS 2
    # Click Insured details button
    # Input Text    xpath=.//input[@id='contactCity']    CHENNAI
    # Click Insured details button
    # Click Insured details button
    # Input Text    id=pinCode    600045 
    # Click Insured details button
    # Click MEDICAL QUESTIONS button
    # Input Text    xpath=.//input[@name='height1']    150
    # Input Text    xpath=.//input[@name='weight1']    60 
    # Click MEDICAL QUESTIONS button
    # Input Text    name=insuredLastName2    Insured last name
    # Click MEDICAL QUESTIONS button
    # Call Sleep
    # Click Element    xpath=.//*[@for='insuredgenderfemale2']
    # Click MEDICAL QUESTIONS button
    # Input Text    xpath=.//input[@name='height2']    150
    # Input Text    xpath=.//input[@name='weight2']    60 
    # Click MEDICAL QUESTIONS button
    # Input Text    xpath=.//input[@name='insuredLastName3']    InsuredThreeLastname
    # Click MEDICAL QUESTIONS button
    # Call Sleep
    # Click Element    xpath=.//*[@for='insuredgendermale3'] 
    # Click MEDICAL QUESTIONS button
    # Call Sleep
    # Input Text    xpath=.//input[@name='height3']    150
    # Input Text    xpath=.//input[@name='weight3']    60 
    # Click MEDICAL QUESTIONS button
    # Sleep    3s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='consultedDoctorno']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='undergoneinvestno']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='omtreatno']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='tmdregularno']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='mcnotseendocno']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='sufferedno']
    # Click ADDITIONAL MEDICAL INFORMATION button
    # Sleep    3s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='consultedDoctorno2']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='undergoneinvestno2']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='omtreatno2']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='tmdregularno2']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='mcnotseendocno2']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='sufferedno2']
    # Click ADDITIONAL MEDICAL INFORMATION button
    # Sleep    3s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='consultedDoctorno3']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='undergoneinvestno3']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='omtreatno3']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='tmdregularno3']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='mcnotseendocno3']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='sufferedno3']
    # Click ADDITIONAL MEDICAL INFORMATION button
    # Sleep    3s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='alcoholno']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='smokingno']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='tgpno']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='narcoticsno']
    # Click GENERAL INFORMATION button
    # Sleep    3s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='alcoholno2']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='smokingno2']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='tgpno2']
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Click Element    xpath=.//label[@for='narcoticsno2']
    # Click GENERAL INFORMATION button
    # Click PAYMENT DETAILS button
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Select From List By Label    relationWithProposer    Brother
    # Click PAYMENT DETAILS button
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Input Text    name=nomineeFirstName    text  
    # Click PAYMENT DETAILS button
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Input Text    name=nomineeLastName    text 
    # Click PAYMENT DETAILS button
    # Sleep    1s
    # SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)  
    # Click Element    xpath=.//input[@id='nomineeDob'] 
    # Select From List By Value    xpath=.//select[@class='ui-datepicker-year']    1999      
    # Click Element    xpath=.//table[@class='ui-datepicker-calendar']/tbody/tr/td/a[contains(.,'25')] 
    # Click PAYMENT DETAILS button
    # Input Text    name=nomineeMobileNumber    ${MobileNumber} 
    # Click PAYMENT DETAILS button
    # Handle OTP Alert message
    # Handle declaration and Terms and Condition
    # Handle Payment Details

    

    

    


    
    
    

    
    
    

    

    
    
    
    

