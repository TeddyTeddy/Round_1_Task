*** Settings ***
Documentation			Contains also the low level keywords that can act on the calculator page
Library                 Collections
Library                 String

*** Keywords ***
Clear Finnish Reference Number Basic Part
    Clear Text      selector=${REFERENCE_NUMBER_CALCULATOR}[basic_part_input_field]

Input Finnish Reference Number Basic Part
    [Arguments]     ${finnish_reference_number_basic_part}
    Fill Text       selector=${REFERENCE_NUMBER_CALCULATOR}[basic_part_input_field]      txt=${finnish_reference_number_basic_part}

Select Number of Reference Numbers
    [Arguments]     ${reference_number_count}
    Click           selector=${REFERENCE_NUMBER_CALCULATOR}[number_of_reference_numbers]
    Select Options By       select[name=label]      text    ${reference_number_count}

Select Reference Number Type
    [Arguments]     ${reference_number_type}
    IF          $reference_number_type=='Suomalainen viitenumero'
        Click           selector=${REFERENCE_NUMBER_CALCULATOR}[reference_number_type_finnish]
    ELSE IF     $reference_number_type=='Kansainvälinen viitenumero'
        Click           selector=${REFERENCE_NUMBER_CALCULATOR}[reference_number_type_international]
    ELSE
        Log To Console      Missing Reference Number Type!
    END

Press Calculate Button
    Click           selector=${REFERENCE_NUMBER_CALCULATOR}[calculate_button]

Fetch Outputted Reference Numbers From The Page
    ${outputted_reference_numbers} =         Create List
    ${table_rows} =     Get Elements         selector=${REFERENCE_NUMBER_CALCULATOR}[outputted_table_rows]
    FOR     ${row}      IN      @{table_rows}
        ${reference_number_text} =    Get Text    ${row}
        ${reference_number_text} =    Remove String    ${reference_number_text}      ${SPACE}
        Append To List      ${outputted_reference_numbers}      ${reference_number_text}
    END
    [Return]   ${outputted_reference_numbers}