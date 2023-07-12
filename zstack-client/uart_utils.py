import serial

ser = serial.Serial("COM6", 38400, timeout=5)
ser.flushInput()


# 读取 uart
def read_uart():
    count = ser.inWaiting()
    if count != 0:
        receive = ""
        try:
            receive = ser.read(ser.in_waiting).decode(encoding="gbk", errors='ignore')
        except Exception as e:
            print(e)
        return receive if receive else ""


# 写入 uart
def write_uart(payload):
    command = payload.decode('gbk')
    print("[42020xxx 指令] >>> 向实验箱写入字符串 %s" % command)
    ser.write(command.encode(encoding='gbk'))
