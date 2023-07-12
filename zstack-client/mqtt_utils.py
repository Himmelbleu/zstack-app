import paho.mqtt.client as mqtt

from pojos import Topic

HOST = "localhost"
PORT = 1883
TIME = 60


# 连接 Mqtt
def connect_mqtt(client_id, username, password):
    c = mqtt.Client(client_id)
    c.username_pw_set(username, password)
    c.connect(HOST, PORT, TIME)
    return c


# 发布主题
def publish_topic(client_id, username, password, topic: Topic):
    c = connect_mqtt(client_id, username, password)
    c.publish(topic=topic.theme, payload=topic.payload, qos=topic.qos)


# 订阅主题
def subscript_topic(client_id, username, password, topic: Topic, on_message):
    c = connect_mqtt(client_id, username, password)
    c.on_message = on_message
    c.subscribe(topic=topic.theme, qos=topic.qos)
    c.loop_forever()
