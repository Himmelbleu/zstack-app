<script setup lang="ts">
import { getTempHumiAll } from "@/apis";

const nowPageNum = ref(1);
const nowPageSize = ref(10);
const tableData = ref();
const formData = ref<TempHumiData>({
  date: "",
  temp: "",
  humi: "",
  ledState: "",
  state: "",
  tempOper: "not",
  humiOper: "not"
});
const state = ref([
  {
    value: "",
    label: "所有状态"
  },
  {
    value: "温湿度传感器异常",
    label: "温湿度传感器异常"
  },
  {
    value: "温湿度传感器正常",
    label: "温湿度传感器正常"
  },
  {
    value: "强制解除温湿度传感器异常",
    label: "强制解除温湿度传感器异常"
  },
  {
    value: "解除温湿度传感器异常",
    label: "解除温湿度传感器异常"
  }
]);
const ledState = ref([
  {
    value: "",
    label: "所有状态"
  },
  {
    value: "off",
    label: "off"
  },
  {
    value: "on",
    label: "on"
  }
]);
const opers = ref([
  {
    value: "not",
    label: "不选"
  },
  {
    value: "gt",
    label: "大于"
  },
  {
    value: "gteq",
    label: "大于等于"
  },
  {
    value: "eq",
    label: "等于"
  },
  {
    value: "lt",
    label: "小于"
  },
  {
    value: "lteq",
    label: "小于等于"
  }
]);

async function fetchData(body: TempHumiData) {
  body.pageNum = nowPageNum.value;
  body.pageSize = nowPageSize.value;
  tableData.value = await getTempHumiAll(body);
}

watch(nowPageNum, async () => {
  await fetchData(formData.value);
});

watch(nowPageSize, async () => {
  await fetchData(formData.value);
});

await fetchData(formData.value);

async function selectBy() {
  await fetchData(formData.value);
}
</script>

<template>
  <div class="mt-5 mb-5">
    <el-form ref="formInst" label-width="100px" label-position="left" :model="formData">
      <el-form-item label="日期" prop="date">
        <el-date-picker
          v-model="formData.date"
          value-format="YYYY-MM-DD"
          type="date"
          placeholder="选择一个日期时间" />
      </el-form-item>
      <el-form-item label="温度" prop="temp">
        <div class="f-c-c">
          <div class="mr-10">
            <el-select v-model="formData.tempOper" placeholder="选择一个温度操作符类型">
              <el-option v-for="item in opers" :label="item.label" :value="item.value" />
            </el-select>
          </div>
          <div>
            <el-input placeholder="输入一个温度值" v-model="formData.temp" />
          </div>
        </div>
      </el-form-item>
      <el-form-item label="湿度" prop="humi">
        <div class="f-c-c">
          <div class="mr-10">
            <el-select v-model="formData.humiOper" placeholder="选择一个湿度操作符类型">
              <el-option v-for="item in opers" :label="item.label" :value="item.value" />
            </el-select>
          </div>
          <div>
            <el-input placeholder="输入一个湿度值" v-model="formData.humi" />
          </div>
        </div>
      </el-form-item>
      <el-form-item label="LED2 状态" prop="ledState">
        <el-select v-model="formData.ledState">
          <el-option v-for="item in ledState" :value="item.value" :label="item.label"> </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="传感器状态" prop="state">
        <el-select v-model="formData.state">
          <el-option v-for="item in state" :value="item.value" :label="item.label"> </el-option>
        </el-select>
      </el-form-item>
    </el-form>
    <div class="f-c-c mt-5">
      <el-button @click="selectBy" type="primary" plain>条件查询</el-button>
    </div>
  </div>
  <div class="f-c-e">
    <el-pagination
      class="mb-5"
      background
      layout="sizes, prev, pager, next"
      :page-sizes="[10, 15, 20, 25, 30, 40, 50, 60]"
      :total="tableData.total"
      v-model:page-size="nowPageSize"
      v-model:current-page="nowPageNum" />
  </div>
  <el-table border :data="tableData.list" style="width: 100%">
    <el-table-column type="index" />
    <el-table-column sortable prop="id" label="ID" width="150" show-overflow-tooltip />
    <el-table-column sortable prop="temp" label="温度" width="120" />
    <el-table-column sortable prop="humi" label="湿度" width="120" />
    <el-table-column sortable prop="date" label="日期" show-overflow-tooltip />
    <el-table-column sortable prop="ledState" label="LED2 状态" width="150" />
    <el-table-column v-slot="{ row }" label="传感器状态" width="150" show-overflow-tooltip>
      <el-tag v-if="row.state == '解除温湿度传感器异常'" type="success">解除异常</el-tag>
      <el-tag v-else-if="row.state == '强制解除温湿度传感器异常'" type="warning">强制解除</el-tag>
      <el-tag v-else-if="row.state == '温湿度传感器异常'" type="danger">异常</el-tag>
      <el-tag v-else>正常</el-tag>
    </el-table-column>
    <el-table-column prop="name" label="姓名" />
    <el-table-column prop="sno" label="学号" />
  </el-table>
</template>

<style lang="scss"></style>
