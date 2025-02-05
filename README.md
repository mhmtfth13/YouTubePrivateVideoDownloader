# YouTube Private  Video Downloader
----------
This batch script automates the process of downloading a YouTube video and audio separately, and then merging them into a single video file. It ensures that the required tools (Python, yt-dlp, and FFmpeg) are installed and sets up everything for you.

---

## Prerequisites

* Python: The script checks if Python is installed. If it's not, the script automatically installs Python for you.
* yt-dlp: This tool is used to download YouTube videos and audio.
* FFmpeg: Required for merging the video and audio files into one file.
Additionally, you will need a cookies.txt file for downloading videos that require authentication or to bypass age restrictions. If you want to take your cookies you can use [Get cookies.txt LOCALLY](https://chromewebstore.google.com/detail/get-cookiestxt-locally/cclelndahbckbenkjhflpdbgdldlbecc?hl=en-US&utm_source=ext_sidebar)
---

## Features

* Automatically checks and installs Python if it's not installed.
* Installs yt-dlp using Python's package manager (pip).
* Install FFmpeg if it's not already installed and adds it to your system's PATH.
* Downloads video and audio from YouTube separately.
* Merges the downloaded video and audio files into a final .mp4 file using FFmpeg.
* Deletes temporary video and audio files after merging.
---

## Requirements

1. Cookies File: You need to have a cookies.txt file in the same directory as the script. This is used by yt-dlp to authenticate and download videos that require a login or have age restrictions.
2. Windows: This script is designed to run on Windows OS.
---

## Setup Instructions

1. Download the Script:
   * Save the batch script to your computer.
2. Prepare the cookies.txt File:
   * Ensure you have a valid cookies.txt file from your browser. This file should be placed in the same directory as the script.
3. Run the Script:
   * Double-click the batch file to run the script.
   * It will check if Python, yt-dlp, and FFmpeg are installed. If not, it will install them for you.
4. Enter the Video URL and Output Name:
   * When prompted, paste the YouTube video URL.
   * Enter the desired output file name (without the file extension).
5. Wait for Completion:
   * The script will download the best video and audio streams from YouTube, merge them, and save the final video as <output_name>_final.mp4.
   * It will then clean up temporary files.
6. Enjoy Your Video:
   * Your merged video will be saved with the name you provided, and it’s ready for playback.
---


## EXAMPLE USAGE

1. Run the batch script.
2. When prompted:
  * Enter the YouTube video URL: https://www.youtube.com/watch?v=asdfasdfasdf
  * Enter the output file name: my_video
3. The script will download the video and audio, merge them, and save the final file as my_video_final.mp4.
---

## Troubleshooting

* Cookies File Missing: If the cookies.txt file is missing, the script will notify you and ask you to place it in the same folder as the batch file.
* FFmpeg Installation Issues: If FFmpeg fails to install or isn't recognized in your system's PATH, make sure to check that the C:\Windows\System32 folder is accessible or manually install FFmpeg.
---
