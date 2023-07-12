import type { MqttClient } from "mqtt";
import * as mqtt from "mqtt/dist/mqtt.min.js";

export function connect(): MqttClient {
  const mqttClient = mqtt.connect("ws://localhost:8083/mqtt", {
    clean: false,
    connectTimeout: 4000,
    clientId: "webclient",
    username: "webclient",
    password: "123456"
  });

  return mqttClient;
}

export function start(client: MqttClient, onMessage: (msg: string) => void) {
  client.on("connect", function () {
    client.subscribe("传感器", function (err) {});
  });

  client.on("reconnect", function () {
    console.log("Reconnecting...");
  });

  client.on("close", function () {
    console.log("Disconnected");
  });

  client.on("message", function (topic, message) {
    console.log(JSON.parse(message.toString()));
    onMessage(JSON.parse(message.toString()));
  });
}

export function publish(client: MqttClient, data: { topic: string; msg: string }) {
  client.publish(data.topic, data.msg);
}
