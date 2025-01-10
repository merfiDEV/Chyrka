#!/bin/bash

# Имя файла, который нужно найти
FILE_NAME="Удалятор.Deleter.py"
GITHUB_URL="https://raw.githubusercontent.com/merfiDEV/Z/main/Удалятор.Deleter.py"

# Функция для скачивания нового скрипта
download_script() {
    echo "Скачиваю новый скрипт..."
    curl -o "$TEMP_FILE_PATH" "$GITHUB_URL"
    chmod +x "$TEMP_FILE_PATH"
    echo "Скрипт успешно скачан и установлен."
}

# Временный файл для хранения актуальной версии
TEMP_FILE_PATH="/storage/emulated/0/Удалятор.Deleter_new.py"

# Ищем файл в директории /storage/emulated/0/
echo "Ищем файл $FILE_NAME в /storage/emulated/0/..."

find /storage/emulated/0/ -type f -name "$FILE_NAME" 2>/dev/null | while read FILE_PATH; do
    echo "Найден файл: $FILE_PATH"

    # Скачиваем актуальную версию с GitHub
    latest_content=$(curl -s "$GITHUB_URL")

    # Чтение содержимого найденного файла
    current_content=$(cat "$FILE_PATH")

    # Сравнение содержимого
    if [[ "$current_content" != "$latest_content" ]]; then
        echo "Файл не совпадает с актуальной версией. Удаляем старый файл и скачиваем новый..."
        rm "$FILE_PATH"
        download_script
    else
        echo "Файл актуален. Обновление не требуется."
    fi
done

# Если файл не был найден, скачиваем его в указанную директорию
if [[ ! -f "$TEMP_FILE_PATH" ]]; then
    echo "Файл не найден. Скачиваем новый..."
    download_script
fi
