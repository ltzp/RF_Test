
*** Settings ***
Library           Selenium2Library
Library           MyLibrary
Library           requests
Library           RequestsLibrary

*** Test Cases ***
test01
    [Documentation]    测试百度搜索
    Open Browser    https://www.baidu.com/    chrome
    input text      xpath=//*[@id="kw"]     虚竹
    Click Element    xpath=//*[@id="su"]
    Sleep    5
    ${url}  get element attribute  xpath = //*[@id="1"]/h3/a     href
    log  ${url}
    click element   xpath = //*[@id="1"]/h3/a
    sleep  3
    Close browser


test02
    [Documentation]  测试关键字
    comment     打印
    log         上海理工大学
    comment     设置变量
    ${cur_name}     set variable    100
    log     ${cur_name}
    comment     时间
    ${times}    get time
    log     ${times}
    comment     强制睡眠
    sleep  3
    comment     拼接字符串
    ${str}      catenate   oracle   mysql   sqlserver
    log  ${str}

test04
    [Tags]  测试数组
    ${0}  evaluate  int(10)
    ${1}  evaluate  int(8)
#    ${0}  evaluate  ${0}+${1}  #进行加减乘除
    ${2}  evaluate  int(20)
#    log  ${0}
    ${nums}=  Create List  ${0}  ${1}  ${2}
#    log  ${nums}
    ${length}=  Get Length  ${nums}
#    log    ${length}
    ${sum}  数组求和  ${nums}
    log  ${sum}
    run keyword if  ${sum} == 38  log  1
        ...  ELSE  log  2


测试天气
    [Tags]  上海
    create session    http://wthrcdn.etouch.cn
    ${url}  get request  ${api}




*** Keywords ***

数组求和
    [Arguments]     ${list}
        ${sum}=  evaluate  int(0)
#        log  ${sum}
#        log  ${list}
        ${length}=  get length  ${list}
        FOR  ${index}  IN RANGE  ${length}
#            log  ${list[${index}]}
            ${sum}  evaluate  ${sum}+${list[${index}]}
            END
        [Return]  ${sum}