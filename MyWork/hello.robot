
*** Settings ***
Library           Selenium2Library

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