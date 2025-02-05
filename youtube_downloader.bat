@echo off
:: Python'ın kurulu olup olmadığını kontrol et
python --version >nul 2>nul
if %errorlevel% neq 0 (
    echo Python bulunamadi. Python kuruluyor...
    :: Python'ı indir ve kur
    powershell -Command "Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.10.6/python-3.10.6.exe -OutFile python_installer.exe"
    python_installer.exe /quiet InstallAllUsers=1 PrependPath=1
    del python_installer.exe
    echo Python kuruldu.
) else (
    echo Python zaten yüklü.
)

:: yt-dlp'yi yükle
echo yt-dlp yukleniyor...
python -m pip install --upgrade pip
python -m pip install yt-dlp
echo yt-dlp yüklendi.

:: FFmpeg'in sistemde kurulu olup olmadığını kontrol et
where ffmpeg >nul 2>nul
if %errorlevel% neq 0 (
    echo FFmpeg bulunamadi, yukleniyor...
    powershell -Command "Invoke-WebRequest -Uri https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl-shared.zip -OutFile ffmpeg.zip"
    
    :: FFmpeg'i çıkart
    powershell -Command "Expand-Archive -Path ffmpeg.zip -DestinationPath ."
    del ffmpeg.zip
    
    :: FFmpeg dosyasını doğru dizine taşı
    move ffmpeg-master-latest-win64-gpl-shared\bin\ffmpeg.exe C:\Windows\System32
    echo FFmpeg yuklendi ve path'e eklendi.
) else (
    echo FFmpeg zaten sistemde mevcut.
)

:: Kullanıcıdan URL ve Dosya Adı bilgilerini al
set /p URL="Indirmek istediginiz video URL'sini girin: "
set /p OUTPUT="Dosya adini girin (uzantisiz): "

:: Video ve Ses dosyasını indir
yt-dlp --cookies www.youtube.com_cookies.txt "%URL%" -f bestvideo -o %OUTPUT%.mp4
yt-dlp --cookies www.youtube.com_cookies.txt "%URL%" -f bestaudio -o %OUTPUT%.m4a

:: Video ve Ses dosyasını birleştir
ffmpeg -i %OUTPUT%.mp4 -i %OUTPUT%.m4a -c copy %OUTPUT%_final.mp4

:: Geçici dosyaları sil
del %OUTPUT%.mp4
del %OUTPUT%.m4a

echo Indirme ve birlestirme tamamlandi!
pause
