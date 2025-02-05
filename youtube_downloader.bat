@echo off
:: Python'ın kurulu olup olmadığını kontrol et
:: Check if Python is installed
python --version >nul 2>nul
if %errorlevel% neq 0 (
    echo Python bulunamadi. Python kuruluyor...
    echo Python not found. Installing Python...
    :: Python'ı indir ve kur
    :: Download and install Python
    powershell -Command "Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.10.6/python-3.10.6.exe -OutFile python_installer.exe"
    python_installer.exe /quiet InstallAllUsers=1 PrependPath=1
    del python_installer.exe
    echo Python kuruldu.
    echo Python has been installed.
) else (
    echo Python zaten yüklü.
    echo Python is already installed.
)

:: yt-dlp'yi yükle
:: Install yt-dlp
echo yt-dlp yukleniyor...
echo Installing yt-dlp...
python -m pip install --upgrade pip
python -m pip install yt-dlp
echo yt-dlp yüklendi.
echo yt-dlp has been installed.

:: FFmpeg'in sistemde kurulu olup olmadığını kontrol et
:: Check if FFmpeg is installed
where ffmpeg >nul 2>nul
if %errorlevel% neq 0 (
    echo FFmpeg bulunamadi, yukleniyor...
    echo FFmpeg not found, installing...
    powershell -Command "Invoke-WebRequest -Uri https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl-shared.zip -OutFile ffmpeg.zip"
    
    :: FFmpeg'i çıkart
    :: Extract FFmpeg
    powershell -Command "Expand-Archive -Path ffmpeg.zip -DestinationPath ."
    del ffmpeg.zip
    
    :: FFmpeg dosyasını doğru dizine taşı
    :: Move FFmpeg to correct directory
    move ffmpeg-master-latest-win64-gpl-shared\bin\ffmpeg.exe C:\Windows\System32
    echo FFmpeg yuklendi ve path'e eklendi.
    echo FFmpeg has been installed and added to the system path.
) else (
    echo FFmpeg zaten sistemde mevcut.
    echo FFmpeg is already installed.
)

:: Kullanıcıdan URL ve Dosya Adı bilgilerini al
:: Get URL and Output file name from the user
set SCRIPT_PATH=%~dp0
set COOKIE_FILE=%SCRIPT_PATH%cookies.txt

if not exist "%COOKIE_FILE%" (
    echo Hata: cookies.txt dosyası bulunamadı!
    echo Error: cookies.txt file not found!
    echo Lütfen cookies.txt dosyasını bu bat dosyası ile aynı klasöre kopyalayın.
    echo Please copy the cookies.txt file to the same directory as this batch file.
    pause
    exit /b 1
)

set /p URL="Indirmek istediginiz video URL'sini girin: "
set /p OUTPUT="Dosya adini girin (uzantisiz): "
set /p URL="Enter the video URL to download: "
set /p OUTPUT="Enter the output file name (without extension): "

echo İndirme başlıyor...
echo Downloading the video...

:: Video ve ses dosyasını indir
:: Download video and audio files
yt-dlp --cookies "%COOKIE_FILE%" "%URL%" -f bestvideo -o %OUTPUT%.mp4
yt-dlp --cookies "%COOKIE_FILE%" "%URL%" -f bestaudio -o %OUTPUT%.m4a

:: Video ve Ses dosyasını birleştir
:: Merge video and audio files
ffmpeg -i %OUTPUT%.mp4 -i %OUTPUT%.m4a -c copy %OUTPUT%_final.mp4

:: Geçici dosyaları sil
:: Delete temporary files
del %OUTPUT%.mp4
del %OUTPUT%.m4a

echo İndirme ve birlestirme tamamlandi!
echo Download and merging completed!
pause
