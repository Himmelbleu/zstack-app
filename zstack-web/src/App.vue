<script setup lang="ts">
const route = useRoute();
const router = useRouter();
const breadcrumbList = shallowRef(getCurrentRoute());

function getCurrentRoute() {
  return router.currentRoute.value.matched;
}

watch(route, () => {
  breadcrumbList.value = getCurrentRoute();
});
</script>

<template>
  <el-container>
    <el-aside width="200px">
      <el-menu router unique-opened>
        <el-menu-item index="/data">
          <template #title>
            <div class="i-tabler-brand-denodo mr-2"></div>
            <span>大数据屏</span>
          </template>
        </el-menu-item>
        <el-sub-menu index="2">
          <template #title>
            <div class="i-tabler-temperature-celsius mr-2"></div>
            <span>温湿度数据</span>
          </template>
          <el-menu-item :index="'/temphu/base'">
            <div class="i-tabler-info-circle mr-2"></div>
            基本信息
          </el-menu-item>
        </el-sub-menu>
        <el-sub-menu index="3">
          <template #title>
            <div class="i-tabler-access-point mr-2"></div>
            <span>红外对射数据</span>
          </template>
          <el-menu-item :index="'/abt/base'">
            <div class="i-tabler-info-circle mr-2"></div>
            基本信息
          </el-menu-item>
        </el-sub-menu>
      </el-menu>
    </el-aside>
    <el-container>
      <el-main>
        <div f-c-s mb-5>
          <div f-c-c class="size-15px text-gray-5">路径：</div>
          <el-breadcrumb separator="/">
            <template v-for="(item, index) in breadcrumbList">
              <el-breadcrumb-item v-if="index != breadcrumbList.length - 1" :to="item.path">
                <span class="size-15px">{{ item.meta.title }}</span>
              </el-breadcrumb-item>
              <el-breadcrumb-item v-else>
                <span class="size-15px">{{ item.meta.title }}</span>
              </el-breadcrumb-item>
            </template>
          </el-breadcrumb>
        </div>
        <RouterView v-slot="{ Component }">
          <template v-if="Component">
            <KeepAlive>
              <Suspense>
                <component :is="Component" />
              </Suspense>
            </KeepAlive>
          </template>
        </RouterView>
      </el-main>
    </el-container>
  </el-container>
</template>
