*** Settings ***

Library     MyLibrary

*** Test Cases ***
test03
    [Documentation]     测试自定义包
    ${a}    evaluate         int(4)
    ${b}    evaluate         int(5)
    ${res}  subtraction     ${a}    ${b}
    log     ${res}
