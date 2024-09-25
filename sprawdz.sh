#!/bin/bash

# Folder, który chcesz monitorować (możesz dodać więcej niż jeden folder)
FOLDERS_TO_CHECK=("/home/maksymilian/minecraft")

# Plik, w którym zapiszemy sumy kontrolne (upewnij się, że ścieżka istnieje)
CHECKSUM_FILE="/home/maksymilian/pliki_z_sumami/sumy_kontrolne.sha512"

# Funkcja do generowania sum kontrolnych
generate_checksums() {
    for folder in "${FOLDERS_TO_CHECK[@]}"; do
        find "$folder" -type f -exec sha512sum {} \; >> "$CHECKSUM_FILE.tmp"
    done
}

# Jeśli plik z sumami kontrolnymi jeszcze nie istnieje, to go tworzymy
if [ ! -f "$CHECKSUM_FILE" ]; then
    echo "Generowanie sum kontrolnych po raz pierwszy..."
    generate_checksums
    mv "$CHECKSUM_FILE.tmp" "$CHECKSUM_FILE"
    echo "Sumy kontrolne zapisane."
    exit 0
fi

# Generowanie nowych sum kontrolnych do porównania
generate_checksums

# Porównywanie nowych sum z zapisanymi
if diff "$CHECKSUM_FILE" "$CHECKSUM_FILE.tmp" > /dev/null; then
    echo "Sumy kontrolne są zgodne."
else
    echo "ZMIANA WYKRYTA!"
    # Możesz dodać tutaj akcje, np. wysyłanie powiadomienia
fi

# Nadpisujemy stare sumy nowymi
mv "$CHECKSUM_FILE.tmp" "$CHECKSUM_FILE"
