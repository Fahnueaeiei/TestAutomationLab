*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Firefox
${URL}        file://${CURDIR}/../StarterFiles/Registration.html

*** Test Cases ***
Open Workshop Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Page Should Contain    Workshop Registration
    Close Browser
Register Success With Organization
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=firstname       Somyod
    Input Text      id=lastname        Sodsai
    Input Text      id=organization    CS KKU
    Input Text      id=email           somyod@kkumail.com
    Input Text      id=phone           091-001-1234
    Click Button    id=registerButton
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Close Browser
Register Success Without Organization
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=firstname       Somyod
    Input Text      id=lastname        Sodsai
    Input Text      id=email           somyod@kkumail.com
    Input Text      id=phone           091-001-1234
    Click Button    id=registerButton
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Close Browser
Empty First Name
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=lastname        Sodyod
    Input Text      id=organization    CS KKU
    Input Text      id=email           somyod@kkumail.com
    Input Text      id=phone           091-001-1234
    Click Button    id=registerButton
    Element Text Should Be    id=errors    *Please enter your first name!!
    Close Browser
Empty Last Name
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=firstname       Somyod
    Input Text      id=organization    CS KKU
    Input Text      id=email           somyod@kkumail.com
    Input Text      id=phone           091-001-1234
    Click Button    id=registerButton
    Element Text Should Be    id=errors    *Please enter your last name!!
    Close Browser
Empty First And Last Name
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=organization    CS KKU
    Input Text      id=email           somyod@kkumail.com
    Input Text      id=phone           091-001-1234
    Click Button    id=registerButton
    Element Text Should Be    id=errors    *Please enter your name!!
    Close Browser
Empty Email
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=firstname       Somyod
    Input Text      id=lastname        Sodsai
    Input Text      id=organization    CS KKU
    Input Text      id=phone           091-001-1234
    Click Button    id=registerButton
    Element Text Should Be    id=errors    *Please enter your email!!
    Close Browser
Empty Phone Number
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=firstname       Somyod
    Input Text      id=lastname        Sodsai
    Input Text      id=organization    CS KKU
    Input Text      id=email           somyod@kkumail.com
    Click Button    id=registerButton
    Element Text Should Be    id=errors    *Please enter your phone number!!
    Close Browser
Invalid Phone Number
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=firstname       Somyod
    Input Text      id=lastname        Sodsai
    Input Text      id=organization    CS KKU
    Input Text      id=email           somyod@kkumail.com
    Input Text      id=phone           1234
    Click Button    id=registerButton
    Element Text Should Be    id=errors    Please enter a valid phone number!!
    Close Browser

