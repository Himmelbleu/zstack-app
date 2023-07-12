import time
import threading
import json

from parse_data import parse_data_from_uart, get_temphu_state_from_uart, get_abt_state_from_uart
from uart_utils import write_uart, read_uart
from mysql_utils import insert_temhu, insert_abt
from mqtt_utils import subscript_topic, publish_topic
from pojos import Topic, TempHu, Abt


def loop_read_uart():
    while True:
        receive = read_uart()
        if receive is not None:
            print('[42020xxx 原始数据] >>> %s' % receive)

            date = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time()))
            temp = parse_data_from_uart(receive, r"temp:(\d+\.\d+)")
            humi = parse_data_from_uart(receive, r"humi:(\d+\.\d+)")

            temphu_state = get_temphu_state_from_uart(receive)
            # if temp and humi:
            #     if float(temp) > 25 or float(humi) > 60:
            #         if temphu_state != '强制解除温湿度传感器异常':
            #             temphu_state = '温湿度传感器异常'

            print(temphu_state)

            abt_state = get_abt_state_from_uart(receive)

            led1_state = parse_data_from_uart(receive, r"led1:(off|on)", 'off')
            led2_state = parse_data_from_uart(receive, r"led2:(off|on)", 'off')

            abt_msg = parse_data_from_uart(receive, r"interrupt", gro=None)

            # 如果温湿度数据匹配到了，把数据插入到数据表1
            if temp and humi:
                # 推送主题，Web 和其他设备都可以收到“传感器”主题
                insert_temhu(TempHu(temp, humi, date, temphu_state, led1_state))

            payload = json.dumps({'num1State': temphu_state, 'num2State': abt_state})
            publish_topic('pyclient1', 'pyclient1', '123456', Topic(theme="传感器", payload=payload, qos=0))

            # 如果红外对射数据匹配到了，说明红外对射被触发了，插入数据表2
            if abt_msg:
                insert_abt(Abt(abt_state, date, abt_msg, led2_state))

        time.sleep(5)


# 处理订阅消息
def handle_sub_topic_msg(client, udata, msg):
    write_uart(msg.payload)


# 开始订阅主题
def start_sub_topic():
    subscript_topic('pyclient2', 'pyclient2', '123456', Topic(theme='command', qos=0), handle_sub_topic_msg)


if __name__ == '__main__':
    ths = [threading.Thread(target=start_sub_topic), threading.Thread(target=loop_read_uart)]

    for t in ths:
        t.start()

    for t in ths:
        t.join()
