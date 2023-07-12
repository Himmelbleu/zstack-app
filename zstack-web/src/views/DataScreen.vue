<script setup lang="ts">
import * as echarts from "echarts";
import { getTempHumiLimit, getTempHumiStateCount, getAbtStateCount } from "@/apis";
import { connect, start, publish } from "@/hooks";

const temphuiChartInst = ref();
const temphuiStateChartInst = ref();
const abtStateChartInst = ref();
const seriesList = await getTempHumiLimit({ limit: 10 });
const tempHumiStateCount = await getTempHumiStateCount();
const abtStateCount = await getAbtStateCount();
const nowCGQState = ref();
const mqttCommand = ref("42020306Num1Ledon");
const num1Command = ref([
  {
    value: "42020306Num1Ledrelie",
    label: "强制关闭 温湿度 异常报警"
  },
  {
    value: "42020306Num1Ledon",
    label: "开启 温湿度 传感器 Led2"
  },
  {
    value: "42020306Num1Ledoff",
    label: "关闭 温湿度 传感器 Led2"
  },
  {
    value: "42020306Num1Ledreopen",
    label: "重新打开 温湿度 异常报警"
  },
  {
    value: "42020306Num2Ledrelie",
    label: "强制关闭 红外对射 异常报警"
  },
  {
    value: "42020306Num2Ledon",
    label: "开启 红外对射 传感器 Led2"
  },
  {
    value: "42020306Num2Ledoff",
    label: "关闭 红外对射 传感器 Led2"
  },
  {
    value: "42020306Num2Ledreopen",
    label: "重新打开 红外对射 异常报警"
  }
]);
const emqxClient = connect();

onMounted(async () => {
  let temphuiChart = echarts.init(temphuiChartInst.value);

  temphuiChart.setOption({
    tooltip: {
      trigger: "axis",
      axisPointer: { type: "cross" }
    },
    xAxis: [
      {
        type: "category",
        axisTick: {
          alignWithLabel: true
        },
        data: seriesList.dates
      }
    ],
    yAxis: [
      {
        type: "value",
        name: "湿度",
        min: 0,
        max: 100,
        position: "right",
        axisLabel: {
          formatter: "{value} RH"
        }
      },
      {
        type: "value",
        name: "温度",
        min: 0,
        max: 100,
        position: "left",
        axisLabel: {
          formatter: "{value} °C"
        }
      }
    ],
    series: [
      {
        name: "湿度",
        type: "bar",
        yAxisIndex: 0,
        data: seriesList.humis
      },
      {
        name: "温度",
        type: "line",
        smooth: true,
        yAxisIndex: 1,
        data: seriesList.temps
      }
    ]
  });

  let temphuiStateChart = echarts.init(temphuiStateChartInst.value);

  temphuiStateChart.setOption({
    tooltip: {
      trigger: "item"
    },
    legend: {
      orient: "vertical",
      left: "left"
    },
    series: [
      {
        type: "pie",
        emphasis: {
          itemStyle: {
            shadowBlur: 10,
            shadowOffsetX: 0,
            shadowColor: "rgba(0, 0, 0, 0.5)"
          }
        },
        data: [
          {
            value: tempHumiStateCount.normalCount,
            name: `正常(${tempHumiStateCount.normalCount})`
          },
          {
            value: tempHumiStateCount.reliveCount,
            name: `异常解除(${tempHumiStateCount.reliveCount})`
          },
          {
            value: tempHumiStateCount.forceCount,
            name: `强制解除(${tempHumiStateCount.forceCount})`
          },
          {
            value: tempHumiStateCount.abnormalCount,
            name: `异常(${tempHumiStateCount.abnormalCount})`
          }
        ]
      }
    ]
  });

  let abtStateChart = echarts.init(abtStateChartInst.value);

  abtStateChart.setOption({
    tooltip: {
      trigger: "item"
    },
    legend: {
      top: "5%",
      left: "center"
    },
    series: [
      {
        type: "pie",
        radius: ["40%", "70%"],
        avoidLabelOverlap: false,
        itemStyle: {
          borderRadius: 10,
          borderColor: "#fff",
          borderWidth: 2
        },
        label: {
          show: false,
          position: "center"
        },
        emphasis: {
          label: {
            show: true,
            fontSize: 40,
            fontWeight: "bold"
          }
        },
        labelLine: {
          show: false
        },
        data: [
          {
            value: abtStateCount.normalCount,
            name: `正常(${abtStateCount.normalCount})`
          },
          {
            value: abtStateCount.reliveCount,
            name: `异常解除(${abtStateCount.reliveCount})`
          },
          {
            value: abtStateCount.forceCount,
            name: `强制解除(${abtStateCount.forceCount})`
          },
          {
            value: abtStateCount.abnormalCount,
            name: `异常(${abtStateCount.abnormalCount})`
          }
        ]
      }
    ]
  });

  start(emqxClient, msg => (nowCGQState.value = msg));
});

function pushCommand() {
  publish(emqxClient, { topic: "command", msg: mqttCommand.value });
}
</script>

<template>
  <div class="my-5 f-s-b" style="width: calc(100vw - 280px)">
    <div class="w-48%">
      <div>
        当前温湿度传感器状态：
        <el-tag v-if="nowCGQState?.num1State == '解除温湿度传感器异常'" type="success"
          >解除异常</el-tag
        >
        <el-tag v-else-if="nowCGQState?.num1State == '强制解除温湿度传感器异常'" type="warning"
          >强制解除</el-tag
        >
        <el-tag v-else-if="nowCGQState?.num1State == '温湿度传感器异常'" type="danger">异常</el-tag>
        <el-tag v-else>正常</el-tag>
      </div>
      <div class="mt-5">
        当前红外对射传感器状态：
        <el-tag v-if="nowCGQState?.num2State == '解除红外对射传感器异常'" type="success"
          >解除异常</el-tag
        >
        <el-tag v-else-if="nowCGQState?.num2State == '强制解除红外对射传感器异常'" type="warning"
          >强制解除</el-tag
        >
        <el-tag v-else-if="nowCGQState?.num2State == '红外对射传感器异常'" type="danger"
          >异常</el-tag
        >
        <el-tag v-else>正常</el-tag>
      </div>
    </div>
    <div class="w-48%">
      <!--  -->
      <el-form>
        <el-form-item label="传感器指令">
          <el-select v-model="mqttCommand">
            <el-option v-for="item in num1Command" :value="item.value" :label="item.label" />
          </el-select>
        </el-form-item>
      </el-form>
      <div class="f-c-e">
        <el-button type="primary" plain @click="pushCommand">发送指令</el-button>
      </div>
    </div>
  </div>
  <div class="f-s-b" style="width: calc(100vw - 280px)">
    <div class="w-48%">
      <div class="font-bold text-1.2rem mb-10 mt-5">最近10次温湿度传感器数据</div>
      <div class="w-100% h-400px" ref="temphuiChartInst"></div>
    </div>
    <div class="w-48%">
      <div class="font-bold text-1.2rem mb-10 mt-5">温湿度传感器状态统计</div>
      <div class="w-100% h-400px" ref="temphuiStateChartInst"></div>
    </div>
  </div>
  <div class="f-c-c mt-10" style="width: calc(100vw - 280px)">
    <div class="w-48%">
      <div class="font-bold text-1.2rem mb-10 mt-5">红外对射传感器状态统计</div>
      <div class="w-100% h-400px" ref="abtStateChartInst"></div>
    </div>
  </div>
</template>

<style scoped lang="scss"></style>
