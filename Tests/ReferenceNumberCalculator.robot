*** Settings ***
Documentation           This is a test suite for Reference Number Calculator (ViiteNumeroLaskuri)
Library                 VerificationEngine
Resource                ../Resources/Common.robot
Resource                ../Resources/PO/ReferenceNumberCalculatorPO.robot

Suite Setup             Begin Web Test
Suite Teardown          End Web Test

*** Keywords ***
Fill In Reference Number Calculator Data And Check The Results
    [Arguments]     ${finnish_reference_number_basic_part}      ${reference_number_count}   ${reference_number_type}
    Clear Finnish Reference Number Basic Part
    Input Finnish Reference Number Basic Part       ${finnish_reference_number_basic_part}
    Select Number of Reference Numbers              ${reference_number_count}
    Select Reference Number Type                    ${reference_number_type}
    Press Calculate Button
    Sleep   2s
    ${outputted_reference_numbers} =       Fetch Outputted Reference Numbers From The Page
    Verify Outputted Reference Numbers      ${finnish_reference_number_basic_part}      ${reference_number_count}   ${reference_number_type}    ${outputted_reference_numbers}

*** Test Cases ***
Verification Engine Smoke Test
    ${finnish_reference_number} =   Generate Finnish Reference Number   12131295
    Should Be Equal As Strings  ${finnish_reference_number}     121312952
    ${international_reference_number} =   Generate International Reference Number   ${finnish_reference_number}
    Should Be Equal As Strings  ${international_reference_number}     RF31121312952

Scenario 1: Number of Reference Numbers is 1 + Finnish Reference Number
    [Template]      Fill In Reference Number Calculator Data And Check The Results
    12131295    1       Suomalainen viitenumero
    12131295    10      Suomalainen viitenumero
    12131295    25      Suomalainen viitenumero
    12131295    50      Suomalainen viitenumero
    12131295    100     Suomalainen viitenumero
    12131295    200     Suomalainen viitenumero
