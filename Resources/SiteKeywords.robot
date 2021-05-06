*** Settings ***
Library    SeleniumLibrary
Variables   ../PageObjects/Locators.py

*** Keywords ***

Otwórz przegladarke
   [Arguments]   ${Url}   ${Browser}
   Open Browser   ${Url}   ${Browser}
   Maximize Browser Window

Przejdz do strony logowania
   Click Element   ${login_btn}
   
Wpisz adres email
   [Arguments]   ${email_field}    ${user_email}
   Input Text   ${email_field}   ${user_email}

Wpisz bledny adres email
   [Arguments]   ${email_field}    ${wrong_user_email}
   Input Text   ${email_field}   ${wrong_user_email}

Wpisz haslo
   [Arguments]   ${pass_field}   ${user_pass}
   Input Text    ${pass_field}   ${user_pass}
   
Nacisnij przycisk Sign In
   Click Button    ${submit_login_btn}

Sprawdz czy uzytkownik jest zalogowany
   Element Should Contain   css:nav > div:nth-of-type(1)    Adam Adam

Sprawdz czy komunikat o blednych danych zostal wyswietlony
   Wait Until Element Is Visible    ${alert}
   Element Should Be Visible    ${alert}
   Element Should Contain    ${alert}   Authentication failed.

Zamknij przegladarke
   Close Browser