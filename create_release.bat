@echo off
set "GITHUB_TOKEN="
gh release create v1.0 "app\build\outputs\apk\release\app-release.apk" --title "FitForge v1.0 - Download APK" --notes "## FitForge - Your Complete Fitness Hub

Download the APK below and install it on your Android phone!

### How to install:
1. Download `app-release.apk` from below
2. Open it on your Android phone
3. Tap Install (enable 'Install from unknown sources' if prompted)
4. Enjoy!

### Features:
- Complete workout routines
- BMI Calculator
- Calorie Counter
- Clock, Alarm, Timer, Stopwatch
- Donate section with Razorpay
- Beautiful dark theme UI"
