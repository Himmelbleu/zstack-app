# 定义主题的实体类对象
class Topic:
    def __init__(self, theme, qos, payload=None):
        # theme：主题
        self.theme = theme
        # qos：mqtt 质量
        self.qos = qos
        # payload：消息
        self.payload = payload


# 温湿度实体类，定义类型
class TempHu:
    def __init__(self, temp, humi, date, state, led_state):
        self.temp = temp
        self.humi = humi
        self.date = date
        self.state = state
        self.led_state = led_state
        self.name = 'Himmelbleu'
        self.sno = '42020xxx'

    # 通过定义 __iter__() 方法将其转换为元组或其他可迭代对象。
    def __iter__(self):
        yield self.temp
        yield self.humi
        yield self.date
        yield self.state
        yield self.led_state
        yield self.name
        yield self.sno


# 红外对射实体类，定义类型
class Abt:
    def __init__(self, state, date, msg, led_state):
        self.state = state
        self.date = date
        self.msg = msg
        self.led_state = led_state
        self.name = 'Himmelbleu'
        self.sno = '42020xxx'

    # 通过定义 __iter__() 方法将其转换为元组或其他可迭代对象。
    def __iter__(self):
        yield self.state
        yield self.date
        yield self.msg
        yield self.led_state
        yield self.name
        yield self.sno
