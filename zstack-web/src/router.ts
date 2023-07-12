import { createRouter, createWebHashHistory } from "vue-router";

const router = createRouter({
  routes: [
    {
      name: "Home",
      path: "/",
      meta: { title: "首页" },
      redirect: "/data",
      component: () => import("@/views/Home.vue"),
      children: [
        {
          name: "DataScreen",
          path: "data",
          meta: { title: "大数据屏" },
          component: () => import("@/views/DataScreen.vue")
        },
        {
          name: "Temphu",
          path: "temphu",
          redirect: '/temphu/base',
          meta: { title: "温湿度数据" },
          component: () => import("@/views/temphu/Temphu.vue"),
          children: [
            {
              name: "TemphuBase",
              path: "base",
              meta: { title: "基本信息" },
              component: () => import("@/views/temphu/TemphuBase.vue")
            }
          ]
        },
        {
          name: "Abt",
          path: "abt",
          redirect: '/abt/base',
          meta: { title: "红外对射数据" },
          component: () => import("@/views/abt/Abt.vue"),
          children: [
            {
              name: "AbtBase",
              path: "base",
              meta: { title: "基本信息" },
              component: () => import("@/views/abt/AbtBase.vue")
            }
          ]
        }
      ]
    }
  ],
  history: createWebHashHistory(),
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition;
    } else {
      return { el: "#app", top: 0, behavior: "smooth" };
    }
  }
});

export default router;
