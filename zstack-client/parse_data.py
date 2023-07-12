import re


# 获取温湿度状态
def get_temphu_state_from_uart(r):
    temp_state = '温湿度传感器正常'
    abnormalnum1 = parse_data_from_uart(r, r"abnormalnum1", gro=0)
    relievenum1 = parse_data_from_uart(r, r"relievenum1", gro=0)
    num1ledrelie = parse_data_from_uart(r, r"num1ledrelie", gro=0)

    if abnormalnum1:
        temp_state = '温湿度传感器异常'

    if relievenum1:
        temp_state = '解除温湿度传感器异常'

    if num1ledrelie:
        temp_state = '强制解除温湿度传感器异常'

    return temp_state


# 获取红外对射状态
def get_abt_state_from_uart(r):
    abt_state = '红外对射传感器正常'
    abnormalnum2 = parse_data_from_uart(r, r"abnormalnum2", gro=0)
    relievenum2 = parse_data_from_uart(r, r"relievenum2", gro=0)
    num2ledrelie = parse_data_from_uart(r, r"num2ledrelie", gro=0)

    if abnormalnum2:
        abt_state = '红外对射传感器异常'

    if relievenum2:
        abt_state = '解除红外对射传感器异常'

    if num2ledrelie:
        abt_state = '强制解除红外对射传感器异常'

    return abt_state


# 清洗串口数据
def parse_data_from_uart(rec, regex, deft=None, gro=1):
    # 正则表达式匹配字符串
    matched = re.search(regex, rec)
    if matched:
        result = matched.group(gro) if gro else matched
    else:
        # 如果没有配到，就返回一个默认值，deft，比如温湿度正常，不传递就返回一个 None 或者空字符串
        result = deft
    print('[42020xxx 正则表达式 %s] >>> 匹配到的字符 %s' % (regex, result))
    return result
