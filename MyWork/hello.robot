
*** Settings ***
Library           Selenium2Library
Library           MyLibrary
Library           requests
Library           RequestsLibrary
Library           Collections

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


测试天气    #测试用例报错，就是直接通不过
    [Tags]  上海
    ${params}   create dictionary   city=上海                     # 参数解析
    create session    api   http://wthrcdn.etouch.cn             # 创建请求
    ${response}  GET On Session  api  /weather_mini    ${params}   # 拼接然后请求
    should be equal as strings  ${response.status_code}  200
    log  ${response.content.decode('utf-8')}
    ${info}  to json   ${response.content.decode('utf-8')}   #返回值转换为json,也就是字典型
    log  ${info}
    ${data}  get from dictionary  ${info}  data    # 得到data的值
    ${flag}  ${msg}  run keyword and ignore error  get from dictionary  ${data}  cmd
    ${value}  set variable  default
    ${result}   set variable if  '${flag}'=='FAIL'  ${value}    ${msg}
    log  ${result}

#    ${forecast}  get from dictionary  ${data}  forecast
#    ${length}  get length  ${forecast}
#    log  ${length}





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