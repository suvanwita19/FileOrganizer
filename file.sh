#!/bin/bash

read -p "Enter directory path: " dir

if [[ -d "$dir" ]]
then
    echo "Organizing files in the directory: "
    cd "$dir"
    mkdir -p Images Videos Documents Music Compressed Programs Others

    for file in * 
    do
        if [[ -d "$file" ]]
        then
            continue
        fi

        filename=$(basename -- "$file")
        ext="${filename##*.}"
        ext="${ext,,}"

        if [[ "$ext" == "jpg" ]] || [[ "$ext" == "jpeg" ]] || [[ "$ext" == "png" ]] || [[ "$ext" == "gif" ]] || [[ "$ext" == "heic" ]] || [[ "$ext" == "webp" ]] || [[ "$ext" == "bmp" ]] || [[ "$ext" == "tiff" ]]; then
            mv "$file" Images/
        elif [[ "$ext" == "mp4" ]] || [[ "$ext" == "mkv" ]] || [[ "$ext" == "avi" ]] || [[ "$ext" == "mov" ]] || [[ "$ext" == "wmv" ]] || [[ "$ext" == "flv" ]] || [[ "$ext" == "webm" ]] || [[ "$ext" == "3gp" ]]; then
            mv "$file" Videos/
        elif [[ "$ext" == "pdf" ]] || [[ "$ext" == "doc" ]] || [[ "$ext" == "docx" ]] || [[ "$ext" == "txt" ]] || [[ "$ext" == "ppt" ]] || [[ "$ext" == "pptx" ]] || [[ "$ext" == "xls" ]] || [[ "$ext" == "xlsx" ]] || [[ "$ext" == "odt" ]] || [[ "$ext" == "ods" ]] || [[ "$ext" == "rtf" ]]; then
            mv "$file" Documents/
        elif [[ "$ext" == "mp3" ]] || [[ "$ext" == "wav" ]] || [[ "$ext" == "flac" ]] || [[ "$ext" == "aac" ]] || [[ "$ext" == "ogg" ]] || [[ "$ext" == "wma" ]] || [[ "$ext" == "m4a" ]]; then
            mv "$file" Music/
        elif [[ "$ext" == "zip" ]] || [[ "$ext" == "rar" ]] || [[ "$ext" == "7z" ]] || [[ "$ext" == "tar" ]] || [[ "$ext" == "gz" ]] || [[ "$ext" == "bz2" ]]; then
            mv "$file" Compressed/
        elif [[ "$ext" == "exe" ]] || [[ "$ext" == "msi" ]] || [[ "$ext" == "deb" ]] || [[ "$ext" == "rpm" ]] || [[ "$ext" == "sh" ]] || [[ "$ext" == "bat" ]] || [[ "$ext" == "apk" ]]; then
            mv "$file" Programs/
        else
            mv "$file" Others/
        fi
    done

    echo "Files sorted successfully!"
else
    echo "No such directory found!"
fi