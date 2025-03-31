#!/bin/bash

# Input nama repo
read -p "Buat repo - masukan nama repo: " namafile

# Key GitHub (disarankan simpan di variabel environment, bukan hardcode)#https://github.com/settings/tokens
key=""

# Membuat folder repo
mkdir -p $namafile

# Input path file yang akan diupload
read -p "Masukan path file yang akan diupload: " dir

# Salin file ke folder repo
cp -r "$dir" "$namafile/"

# Inisialisasi git
cd "$namafile"
curl -s -u "ewinz19:$key" -X POST https://api.github.com/user/repos -d '{"name":"'"$namafile"'"}' > /dev/null

git init

# Konfigurasi remote
git remote remove origin  # Hapus remote lama
git remote add origin https://ewinz19:$key@github.com/ewinz19/$namafile.git

# Proses git standar
git add .
git commit -m "Initial commit"

# Buat branch main jika belum ada
git branch -M main

# Push ke GitHub
git push -u origin main
