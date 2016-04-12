*** Settings ***
Library           AppiumLibrary

*** Keywords ***
OpenApp
    [Arguments]    ${remote_url}=http://127.0.0.1:4723/wd/hub    ${alias}=None    ${platformName}=iOS    ${platformVersion}=8.4    ${deviceName}=iPhone 6    ${browserName}=Safari
    Open Application    remote_url=${remoteurl}    allias=${alias}    platformName=${platformName}    plateformVersion=${platformVersion}    deviceName=${deviceName}    browserName=${browserName}
