*** Settings ***
Documentation		Reference Number Calculator's Page's Locators for Firefox Browser are listed here


*** Variables ***
&{REFERENCE_NUMBER_CALCULATOR}
...                 accept_all_cookies=//*[@id="CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll"]
...					basic_part_input_field=//*[@id="fg-input-referenceNumberBase"]
...					number_of_reference_numbers=//*[@id="ig-select-referenceNumberAmount"]
...					reference_number_type_finnish=//*[@id="ig-radiogroup-referenceNumberType"]/label[1]/div/span
...					reference_number_type_international=//*[@id="ig-radiogroup-referenceNumberType"]/label[2]/div/span
...					calculate_button=//*[@id="MainContentSection_T17BA5993010_Col00"]/referencenumber-calculator/app-container/div/div/calculator/form-control-group/div[2]/div/button				# on the upper right corner
...                 aktia_bot_close_button=html body div#chat-container div.sc-krvtoX.eupfOd.bai-StyleReset div.sc-clNaTc.GdaCk div.sc-etwtAo.llxDAm div.sc-gtfDJT.iRNHbE.ChatWindow div.sc-fOICqy.yZmkT div.sc-ckVGcZ.bDZRfU.TitleBar button.sc-kGXeez.bHFvHU svg.sc-bdVaJa.hzwcTK.sc-kpOJdX.hlUeEN
...                 aktia_bot_activation_button=//*[@id="chatbotIcon"]
...                 outputted_table_rows=//html/body/div[3]/main/div[4]/div/div/referencenumber-calculator/app-container/div/div/calculator/form-control-group/div[3]/div/table/tr/td