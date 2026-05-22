@echo off
set "GITHUB_TOKEN="
gh repo create fitforge-android --public --source=. --push --description "FitForge - Your Complete Fitness Hub Android App"
