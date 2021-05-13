*** Settings ***
Library    SeleniumLibrary
Variables   ../PageObjects/Locators.py
Variables   ../PageObjects/randommail.py

*** Variables ***
${Url}   http://automationpractice.com/
${Browser}   chrome
${user_email}   user+test@example.com
${user_pass}   pas123456
${wrong_user_email}   wrong@ee.pl

*** Keywords ***
Prepare Env
   Set Screenshot Directory    Screenshots

Otwórz przegladarke
   [Arguments]   ${Url}   ${Browser}
   Open Browser   ${Url}   ${Browser}
   Maximize Browser Window

Przejdz do strony logowania
   Click Element   ${login_btn}

Przejdz do strony rejestracji
   Click Element   ${login_btn}

Wpisz adres email nowego uzytkownika
  Input Text    ${email_register}   ${mail}

Potwierdz rejestracje
   Click Element    ${submit_register}

Wpisz adres email
   [Arguments]   ${email_field}    ${user_email}
   Input Text   ${email_field}   ${user_email}

Wpisz bledny adres email
   [Arguments]   ${email_field}    ${wrong_user_email}
   Wait Until Element Is Visible    ${email_field}
   Input Text   ${email_field}   ${wrong_user_email}

Wpisz haslo
   [Arguments]   ${pass_field}   ${user_pass}
   Input Text    ${pass_field}   ${user_pass}
   
Nacisnij przycisk Sign In
   Click Button    ${submit_login_btn}

Sprawdz czy uzytkownik jest zalogowany
   Element Should Contain   ${user_login_name}    Adam Adam
   Element Should Be Visible    ${my_account}
   Element Should Contain   ${my_account}   MY ACCOUNT

Sprawdz czy komunikat o blednych danych zostal wyswietlony
   Wait Until Element Is Visible    ${alert}
   Element Should Be Visible    ${alert}
   Element Should Contain    ${alert}   Authentication failed.

Zamknij przegladarke
   Close Browser
   
Nacisnij przycisk Sign Out
   Wait Until Element Is Visible    ${sign_out}
   Click Element   ${sign_out}
   Sleep    5

Sprawdz czy uzytkownik zostal wylogowany
    Element Should Contain    ${my_account}    AUTHENTICATION

Kliknij Register
   Wait Until Element Is Visible    ${register_btn}
   Click Element    ${register_btn}

Sprawdz czy pojawił sie error
   Wait Until Element Is Visible   ${alert}
   Element Should Be Visible    ${alert}
   
Kliknij forgot password
    Wait Until Element Is Visible   ${forgot_pass}
    Click Element    ${forgot_pass}

Potwierdz odzyskanie hasla
    Click Element    ${retrive_pass}


