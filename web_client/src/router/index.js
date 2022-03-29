import { createRouter, createWebHistory } from "vue-router";
import { getAuth, createUserWithEmailAndPassword } from "firebase/auth";

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: "/",
      component: () => import("../views/Home.vue"),
    },
    {
      path: "/sign-up",
      component: () => import("../views/SignUp.vue"),
    },
    {
      path: "/sign-in",
      component: () => import("../views/SignIn.vue"),
    },
    {
      path: "/feed",
      component: () => import("../views/Feed.vue"),
    },
  ],
});

export default router;