# sha_and_crone
instrukcja :
1. sprawdz czy posiadasz sha512sum
2. jeśli nie posiadasz zainstaluj sudo apt install coreutils
3. instalacja preferowanego edytora np. nano
4. git clone https://github.com/MaksymilianKnyba/shai_and_crone
5. nano sprawdz.sh
6. w linijce folders_to_check podajemy scieżke folder bądz pliki które chcemy sprawdzac sume kontrolną
7. w linijce checksum_file podajemy scieżke do folderu gdzie bedziemy zapisywac sumy kontolne
8. zapisz zmiany i wyjdz
9. nadaj odpowiednie uprawnienia do sprawdz.sh
Automatyzacja skryptu
1. cronetab -e
2. wklej na sam koniec pliku 0 * * * * /bin/bash ~/sprawdz.sh >> ~/sprawdz_sumy.log 2>&1
3. zapisz i wyjdz


By Maksymilian Knyba
