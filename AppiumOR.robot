*** Settings ***
Library           AppiumLibrary    run_on_failure=AppiumLibrary.CapturePageScreenshot
Library           Selenium2Library    run_on_failure=AppiumLibrary.CapturePageScreenshot

*** Variables ***
${WebApp}         http://dinencarryout.com/
${lnkSubmit}      css=input[type='submit']
${Screenshot}     AppScreenShot.png    # This is for taking photos of the Web App or Native App while test is going.
${lnkRestaurant}    xpath=//h2[.='DONJUAN']
${lnkTacoBeef}    xpath=//p[@class='ui-li-desc']//child::strong[.='Taco - Beef']    # css=.ui-li-desc>strong:contains(Taco - Beef)
${txtSpecialInst}    css=#specialinstructions
${sndKey}         Hold the lettuce!
${lnkAddToCart}    css=[id='btnaddeditorderitem']
${eleAmount}      xpath=//h3[contains(text(),'Order Amount: $2.94')]
${expectedAmount}    Order Amount: $2.94    # This is the expected result
${lnkBurritoDJChicken}    xpath=//p[@class='ui-li-desc']//child::strong[.='Burrito Dj \ Chicken']
${lnkOrderQuantity}    css=#orderquantity
${lnkNum2}        xpath=//*[@id='orderquantity']/option[2]
${lnkCheckout}    css=#btnaddeditorderitem
${lnkSubmitOrder}    xpath=//*[@id='divcheckoutfooter']/div/div[2]/a/span/span
${txtEmail}       css=#Email
${txtPswd}        css=#Password
${sndEmail}       geefung@gmail.com
${sndUsername}    elements
${lnkSubmitFinalOrder}    css=input.ui-btn-hidden
${APPIUM_NODE}    /Applications/Appium.app/Contents/Resources/node/bin/node
${lnkAddContact}    id=addContactButton    # This is for Contact Manager .apk
${txtContactName}    id=com.example.android.contactmanager:id/contactNameEditText    # Contact Manager app
${sndValueContactMgr}    Gary Fung
${txtEmailContactMgr}    id=com.example.android.contactmanager:id/contactEmailEditText    # Contact Manager apk
${sndEmailContactMgr}    geefung@gmail.com    # Contact Manager apk
${lnkSaveButtonContactMgr}    id=com.example.android.contactmanager:id/contactSaveButton    # Contact Manager apk
