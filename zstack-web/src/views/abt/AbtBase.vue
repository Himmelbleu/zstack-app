<script setup lang="ts">
import { getAbtAll } from "@/apis";

const tableData = ref();
const nowPageNum = ref(1);
const nowPageSize = ref(10);
const formData = ref<AbtData>({
  date: "",
  ledState: "",
  state: ""
});
const state = ref([
  {
    value: "",
    label: "所有状态"
  },
  {
    value: "红外对射传感器异常",
    label: "红外对射传感器异常"
  },
  {
    value: "红外对射传感器正常",
    label: "红外对射传感器正常"
  },
  {
    value: "强制解除红外对射传感器异常",
    label: "强制解除红外对射传感器异常"
  },
  {
    value: "解除红外对射传感器异常",
    label: "解除红外对射传感器异常"
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

async function fetchData(body: AbtData) {
  body.pageNum = nowPageNum.value;
  body.pageSize = nowPageSize.value;
  tableData.value = await getAbtAll(body);
}

watch(nowPageNum, async () => {
  await fetchData(formData.value);
});

watch(nowPageSize, async () => {
  await fetchData(formData.value);
});

await fetchData(formData.value);

console.log(tableData.value);

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
    <el-table-column sortable prop="date" label="日期" show-overflow-tooltip />
    <el-table-column sortable prop="ledState" label="LED2 状态" width="150" />
    <el-table-column v-slot="{ row }" label="传感器状态" width="150" show-overflow-tooltip>
      <el-tag v-if="row.state == '解除红外对射传感器异常'" type="success">解除异常</el-tag>
      <el-tag v-else-if="row.state == '强制解除红外对射传感器异常'" type="warning">强制解除</el-tag>
      <el-tag v-else-if="row.state == '红外对射传感器异常'" type="danger">异常</el-tag>
      <el-tag v-else>正常</el-tag>
    </el-table-column>
    <el-table-column prop="name" label="姓名" />
    <el-table-column prop="sno" label="学号" />
  </el-table>
</template>

<style scoped lang="scss"></style>
