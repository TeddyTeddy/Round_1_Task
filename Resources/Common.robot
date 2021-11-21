*** Settings ***
Documentation					Common keywords and variables defined here for the ViiteNumeroLaskuri test suite
Library							OperatingSystem
Library							Browser		timeout=30s		auto_closing_level=SUITE	enable_presenter_mode=${True}


*** Variables ***
${LOCATORS_PATH}						${EXECDIR}${/}Resources${/}Locators${/}
${BROWSER}								chromium
${REFERENCE_NUMBER_CALCULATOR_URL}     	https://www.aktia.fi/fi/yritysasiakkaat/viitenumerolaskuri

*** Keywords ***
Begin Web Test
	Load Locator Resources
	New Browser 	browser=${BROWSER}	 headless=False
	New Context
	New Page
	Go To 		${REFERENCE_NUMBER_CALCULATOR_URL}
	Sleep  	3s
	Run Keyword And Ignore Error	Click  selector=${REFERENCE_NUMBER_CALCULATOR}[accept_all_cookies]
	Run Keyword And Ignore Error	Click  selector=${REFERENCE_NUMBER_CALCULATOR}[aktia_bot_activation_button]
	Run Keyword And Ignore Error	Click  selector=${REFERENCE_NUMBER_CALCULATOR}[aktia_bot_close_button]

End Web Test
	Close Browser

Load Locator Resources
	[Documentation]   Depending on the browser used, it loads the corresponding locator resource files
	IF		'${BROWSER}'=='firefox' or '${BROWSER}'=='ff'
	    Import Locators		${LOCATORS_PATH}Firefox
	END
	IF		'${BROWSER}'=='chrome' or '${BROWSER}'=='gc'
	    Import Locators		${LOCATORS_PATH}Chrome
	END
	IF		'${BROWSER}'=='chromium'
		Import Locators		${LOCATORS_PATH}Chromium
	END

Import Locators
	[Arguments]				${locators_path}
	${locator_files} 		List Files In Directory			${locators_path}		*Locators.resource		absolute
	FOR		${locator_file}	IN		@{locator_files}
		Log To Console		Loading the resource file: ${locator_file}
		Import Resource		${locator_file}
	END

Verify Outputted Reference Numbers
	[Arguments]		${finnish_reference_number_basic_part}      ${reference_number_count}   ${reference_number_type}    ${outputted_reference_numbers}
	# Pseudocode on how to implement this keyword
	IF		$reference_number_type=='Suomalainen viitenumero'
		Verify Finnish Reference Numbers	${finnish_reference_number_basic_part}		${reference_number_count}		${outputted_reference_numbers}
	ELSE IF		$reference_number_type=='Kansainvälinen viitenumero'
		Verify International Reference Numbers	${finnish_reference_number_basic_part}		${reference_number_count}		${outputted_reference_numbers}
    ELSE
        Log To Console      Missing Reference Number Type!
    END

Verify Finnish Reference Numbers
	[Arguments]		${finnish_reference_number_basic_part}		${reference_number_count}		${outputted_reference_numbers}
	FOR  	${outputted_finnish_reference_number}	IN		@{outputted_reference_numbers}
		${reference_finnish_reference_number} = 	Generate Finnish Reference Number		${finnish_reference_number_basic_part}
		Should Be Equal As Strings		${reference_finnish_reference_number}				${outputted_finnish_reference_number}
	END