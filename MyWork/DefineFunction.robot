*** Settings ***

Library     MyLibrary

*** Test Cases ***
test 01
    [Documentation]     测试自定义包
    ${a}    evaluate         int(4)
    ${b}    evaluate         int(5)
    ${add}  subtraction     ${a}    ${b}
    log     ${add}