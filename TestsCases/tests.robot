*** Settings ***
Metadata  Author   Adrian Dubel <adrian.dubel88@gmail.com>
Resource   ../Resources/SiteKeywords.robot
Suite Setup   Prepare Env

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

TC_03 - Sprawdzenie czy użytkownik jest wylogowany
    [Setup]   Otwórz przegladarke   ${Url}   ${Browser}
    Przejdz do strony logowania
    Wpisz adres email   ${email_field}   ${user_email}
    Wpisz haslo   ${pass_field}   ${user_pass}
    Nacisnij przycisk Sign In
    Nacisnij przycisk Sign Out
    Sprawdz czy uzytkownik zostal wylogowany
    [Teardown]   Zamknij przegladarke


TC_04 - Sprawdź, czy nie wypełnienie obowiązkowych pol doprowadzi do błędu walidacji
    [Setup]   Otwórz przegladarke   ${Url}   ${Browser}
    Przejdz do strony rejestracji
    Wpisz adres email nowego uzytkownika
    Potwierdz rejestracje
    Kliknij Register
    Sprawdz czy pojawił sie error
    [Teardown]   Zamknij przegladarke

TC_05 - Sprawdzenie funkcjonalnosci "Forgot your password?" dla niezarejestrowanego uzytkownika
    [Setup]   Otwórz przegladarke   ${Url}   ${Browser}
    Przejdz do strony rejestracji
    Kliknij forgot password
    Wpisz bledny adres email    ${email_field}    ${wrong_user_email}
    Potwierdz odzyskanie hasla
    Sprawdz czy pojawił sie error
    [Teardown]   Zamknij przegladarke









