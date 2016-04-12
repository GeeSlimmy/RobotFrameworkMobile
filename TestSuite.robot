*** Settings ***
Documentation     Suite description: This project / suite can run test on Appium Server locally as well as with Saucelabs, or and AWS.
Suite Teardown
Library           AppiumLibrary    run_on_failure=AppiumLibrary.CapturePageScreenshot
Library           Selenium2Library    run_on_failure=AppiumLibrary.CapturePageScreenshot
Resource          AppiumOR.robot    # This is the Object Repository for Appium Mobile objects
Library           Process
Resource          MobileKeywords.robot    # This is the keyword library

*** Test Cases ***
Test title
    [Tags]    OPENAPP
    ${result}=    Run Process    killall nodes    shell=True
    Comment    Process.Start Process    /Applications/Appium.app/Contents/Resources/node/bin/node    /Applications/Appium.app/Contents/Resources/node_modules/appium/bin/appium.js    address=false    127.0.0.1    port=4723
    ...    --no-reset=false
    Comment    Terminate All Processes    kill=true
    Comment    Open Application    http://127.0.0.1:4723/wd/hub    alias=None    platformName=iOS    platformVersion=8.4    deviceName=iPhone 6
    ...    browserName=Safari
    Comment    Open Application    http://127.0.0.1:4723/wd/hub    platformName=Android    platformVersion=4.4    deviceName=Android Emulator    app=/Users/Admin/Downloads/Cornerstone.UI.noBE.Dev.107.ipa
    ...    appPackage=com.csod.mobile.CSOD    appActivity=com.csod.mobile.CSOD.MainActivity
    ${result}=    Run Process    /Applications/Appium.app/Contents/Resources/node/bin/node    /Applications/Appium.app/Contents/Resources/node_modules/appium/bin/appium.js    --address \= false    127.0.0.1    --port \= false
    ...    4723    --no reset
    OpenApp
    Comment    Open Application    http://127.0.0.1:4723/wd/hub    alias=None    platformName=Android    platformVersion=4.4    deviceName=Nexus_S
    ...    browserName=Browser
    Comment    open browser    http://www.google.com/
    Comment    Open Application    http://AppiumTesterGuy:483dc4df-76de-4b97-a948-8c170fd3f264@ondemand.saucelabs.com:80/wd/hub    platformName=Android    platformVersion=4.4    deviceName=Samsung Galaxy S4 Emulator    browserName=Browser
    ...    build=QA-Device-Test-2    name=Android Device Test    tag=Android-App-Samsung-Galaxy-S4    passed=TRUE
    Comment    Open Application    http://AppiumTesterGuy:483dc4df-76de-4b97-a948-8c170fd3f264@ondemand.saucelabs.com:80/wd/hub    platformName=iOS    platformVersion=9.2    deviceName=iPhone 6 Plus    browserName=Safari
    ...    build=QA-Device-Test-1    name=iOS Device Test    tag=iOS-App-iPhone 6 Plus    passed=TRUE
    Landscape
    Go To Url    ${WebApp}
    Sleep    10s
    AppiumLibrary.Log Source    loglevel=INFO
    AppiumLibrary.Capture Page Screenshot    ${Screenshot}
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    ${lnkSubmit}
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    ${lnkRestaurant}
    Wait Until Keyword Succeeds    2 x    7s    AppiumLibrary.Click Element    ${lnkTacoBeef}
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Input Text    ${txtSpecialInst}    ${sndKey}
    AppiumLibrary.Click Element    ${lnkAddToCart}
    Comment    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Element Attribute Should Match    ${eleAmount}    text
    ...    ${eleAmount}
    Comment    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Element Value Should Be    ${eleAmount}    ${expectedAmount}
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    ${lnkBurritoDJChicken}
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    ${lnkOrderQuantity}
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    ${lnkNum2}
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    ${lnkCheckout}
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    ${lnkSubmitOrder}
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    ${lnkSubmit}
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Input Text    ${txtEmail}    ${sndEmail}
    AppiumLibrary.Input Text    ${txtPswd}    ${sndUsername}
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    ${lnkSubmit}
    Sleep    5s
    Close Application

AppiumServer
    ${result}=    Process.Run Process    python    -c    print "hello world"
    Comment    ${result}=    Process.Run Process    /Applications/Appium.app/Contents/Resources/node/bin/node | /Applications/Appium.app/Contents/Resources/node_modules/appium/bin/appium.js | --address, false | 127.0.0.1 | --port, false | 4723 | \ --no-reset    timeout=10s
    ${result}=    Run Process    killall nodes    shell=True
    Comment    ${result}=    Start Process    /Applications/Appium.app/Contents/Resources/node/bin/node    Start Process    /Applications/Appium.app/Contents/Resources/node_modules/appium/bin/appium.js    Start Process
    Comment    ${result}=    Process.Run Process    appium &    timeout=10s
    Comment    Terminate All Processes    kill=true
    ${result}=    Run Process    /Applications/Appium.app/Contents/Resources/node/bin/node    /Applications/Appium.app/Contents/Resources/node_modules/appium/bin/appium.js    --address \= false    127.0.0.1    --port \= false
    ...    4723    --no reset
    open application    http://127.0.0.1:4723/wd/hub    alias=None    platformName=iOS    platformVersion=8.4    deviceName=iPhone 6    browserName=Safari

NativeAppTest
    Open Application    http://127.0.0.1:4723/wd/hub    platformName=Android    platformVersion=4.4.2    deviceName=/Users/Admin/.android/avd/Nexus_S.avd    app=/Users/Admin/Downloads/android-release.apk    appPackage=com.csod.mobile.CSOD
    ...    appActivity=com.csod.mobile.CSOD.MainActivity
    Comment    Open Application    http://127.0.0.1:4723/wd/hub    platformName=Android    platformVersion=4.4.2    deviceName=/Users/Admin/.android/avd/Nexus_S.avd    app=/Users/Admin/Downloads/JSC_Salon.apk
    ...    appPackage=com.example.jscbopal.myapplicationtbl    appActivity=com.example.jscbopal.view.MainActivity
    Comment    Open Application    http://127.0.0.1:4723/wd/hub    platformName=Android    platformVersion=5.1.1    deviceName=/Users/Admin/.android/avd/Galaxy_Nexus.avd    app=/Users/Admin/Downloads/android-release.apk
    ...    appPackage=com.csod.mobile.CSOD    appActivity=com.csod.mobile.CSOD.MainActivity

NativeAppTest2
    Comment    Open Application    http://127.0.0.1:4723/wd/hub    platformName=Android    platformVersion=5.1    deviceName=/Users/Admin/.android/avd/Galaxy_Nexus.avd    app=/Users/Admin/Downloads/android-release.apk
    ...    appPackage=com.csod.mobile.CSOD    appActivity=com.csod.mobile.CSOD.MainActivity
    Comment    Open Application    http://127.0.0.1:4723/wd/hub    platformName=Android    platformVersion=4.4    deviceName=/Users/Admin/.android/avd/Nexus_S.avd    app=/Users/Admin/Downloads/ContactManager-4.apk
    ...    appPackage=com.example.android.contactmanager    appActivity=.ContactManager
    Comment    AppiumLibrary.Click Element    ${lnkAddContact}
    Comment    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Input Text    ${txtContactName}    ${sndValueContactMgr}
    Comment    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Input Text    ${txtEmailContactMgr}    ${sndEmailContactMgr}
    Comment    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    ${lnkSaveButtonContactMgr}

*** Keywords ***
SauceLabs
    Setup system under test
    Reset Application
