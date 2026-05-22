@echo off
set "JAVA_HOME=C:\Users\yash9\AppData\Local\Java\jdk-17.0.11+9"
set "PATH=%JAVA_HOME%\bin;%PATH%"
cd /d "%~dp0"
call gradlew.bat assembleRelease
