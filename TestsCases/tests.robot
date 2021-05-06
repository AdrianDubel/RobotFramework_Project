*** Settings ***
Library   SeleniumLibrary
Resource   ../Resources/SiteKeywords.robot
Suite Setup   Prepare Env

*** Variables ***
${Url}   http://automationpractice.com/
${Browser}   chrome
${user_email}   user+test@example.com
${user_pass}   pas123456
${wrong_user_email}   wrong@ee.pl

*** Test Cases ***
TC_01 - Logowanie z poprawnymi danymi
    [Setup]   Otwórz przegladarke   ${Url}   ${Browser}
    Przejdz do strony logowania
    Wpisz adres email   ${email_field}   ${user_email}
    Wpisz haslo   ${pass_field}   ${user_pass}
    Nacisnij przycisk Sign In
    Sprawdz czy uzytkownik jest zalogowany
    [Teardown]   Zamknij przegladarke

TC_02 - Logowanie z nieprawidlowa nazwa użytkownika
    [Setup]   Otwórz przegladarke   ${Url}   ${Browser}
    Przejdz do strony logowania
    Wpisz bledny adres email   ${email_field}   ${wrong_user_email}
    Wpisz haslo   ${pass_field}   ${user_pass}
    Nacisnij przycisk Sign In
    Sprawdz czy komunikat o blednych danych zostal wyswietlony
    [Teardown]   Zamknij przegladarke

TC_03 - Sparwdzenie czy użytkownik jest wylogowany
    [Setup]   Otwórz przegladarke   ${Url}   ${Browser}
    Przejdz do strony logowania
    Wpisz adres email   ${email_field}   ${user_email}
    Wpisz haslo   ${pass_field}   ${user_pass}
    Nacisnij przycisk Sign In


