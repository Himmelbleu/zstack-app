/* Import Vue */
import App from "@/App.vue";
import router from "@/router";
import { createApp } from "vue";
import { createPinia } from "pinia";
/* Import CSS */
import "uno.css";
import "@/style.scss";

const app = createApp(App);
app.use(router);
app.use(createPinia());

app.mount("#app");
