@echo off
set "GITHUB_TOKEN="
gh release upload v1.0 "app\build\outputs\apk\release\app-release.apk" --clobber
