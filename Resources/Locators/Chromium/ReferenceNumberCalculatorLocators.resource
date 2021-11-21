*** Settings ***
Documentation		Reference Number Calculator's Page's Locators for Chromium Browser are listed here


*** Variables ***
&{REFERENCE_NUMBER_CALCULATOR}
...					basic_part_input_field=//*[@id="fg-input-referenceNumberBase"]
...					number_of_reference_numbers=//*[@id="ig-select-referenceNumberAmount"]
...					reference_number_type_finnish=//*[@id="ig-radiogroup-referenceNumberType"]/label[1]/div/span
...					reference_number_type_international=//*[@id="ig-radiogroup-referenceNumberType"]/label[2]/div/span
...					calculate_button=//*[@id="MainContentSection_T17BA5993010_Col00"]/referencenumber-calculator/app-container/div/div/calculator/form-control-group/div[2]/div/button				# on the upper right corner
