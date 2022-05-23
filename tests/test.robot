*** Settings ***
Library   Browser

*** Test Cases ***
Example Test

    New Browser   Chromium
    New Page    https://playwright.dev
    Get Text    h1    contains    Playwright