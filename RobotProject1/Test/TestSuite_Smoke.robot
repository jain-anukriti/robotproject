*** Settings ***
Library    SeleniumLibrary
Suite Setup    Log    Entering ${SUITE_NAME}
Suite Teardown    Log    Finishing ${SUITE_NAME}
Test Setup    Log    Entering test
Test Teardown    Log    Finishing test

Default Tags    Smoke

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

&{CRED}    uname=Admin    pwd=admin123    #cred for login

*** Test Cases ***
Test1
    Log To Console    Hello World...
    
SeleniumTest
    Open Browser    ${URL}    chrome
    Close Browser
    
LoginTest
    [Documentation]    Testing login
    [Setup]    GoToURL
    Set Browser Implicit Wait    5
    Input Text    name:username    &{CRED}[uname]
    Input Password    name:password    &{CRED}[pwd]
    Click Button    xpath://div[@class='orangehrm-login-form']//button
    Log     ${TEST_NAME} Completed 
    Close All Browsers
    
MyFirstTest
    [Tags]    Sanity   
    Log     I'm in ${TEST_NAME} 
    Set Tags    Regression 
MySecTest
    Log     I'm in ${TEST_NAME}
    Set Tags    Regression 
    Remove Tags    Smoke
MyThirdTest
    Log     I'm in ${TEST_NAME} 

MyFourthTest
    Log     I'm in ${TEST_NAME} 
    
*** Keywords ***
GoToURL
    Open Browser    ${URL}    chrome
    