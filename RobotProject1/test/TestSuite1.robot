*** Settings ***
Library    SeleniumLibrary
Suite Setup    Log    I am inside Test Suite setUp
Suite Teardown    Log    I am inside Test Suite tearDown
Test Setup    Log    I am inside Test Case setUp
Test Teardown    Log    I am inside Test Case tearDown

Default Tags    sanity

*** Test Cases ***
MyFirstTest
    [Tags]    smoke
    Log    Hello World...

MySecondTest
    Set Tags    regression1
    Log    I am inside Second Test 
    
MyThirdTest
    Log    I am inside Third Test     
    
MyFourthTest
    Log    I am inside 4rh Test 
    
FirstSeleniumTest
    Open Browser    http://google.com    chrome
    Set Browser Implicit Wait    5
    Input Text    name=q    Automation Step by step
    Press Keys    name=q    RETURN
    Sleep    2      
    Close Browser
    Log    Test Completed
    
SampleLoginTest
    [Documentation]    This is sample login test
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKW
    #Input Text    id=txtUsername    @{CREDENTIALS}[0]
    #Input Password    id=txtPassword    &{LOGINDATA}[password]
    #Click Button    id=btnLogin
    Click Element    id=welcome
    Click Link    link=Logout
    Close Browser
    Log    Test Completed
    Log    This test was executed by %{username} on %{os}           

*** Variables ***
# SCALAR Variable
${URL}     https://opensource-demo.orangehrmlive.com/          
#LIST Variable
@{CREDENTIALS}    Admin    admin123
#DICTIONARY Variable
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text    id=txtUsername    @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Button    id=btnLogin