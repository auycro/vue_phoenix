<template>
  <div class="router-wrapper">
    <nav>
      <router-link to="/"> Home </router-link> |
      <!--
      <router-link to="/feed"> Feed </router-link> |
      -->
      <span v-if="isLoggedIn">
        <router-link to="/feed"> Feed </router-link> |
        <button @click="logout">Logout</button>
      </span>
      <span v-else>
        <router-link to="/sign-up"> Sign Up </router-link> |
        <router-link to="/sign-in"> Sign In </router-link> |
      </span>
    </nav>
    <router-view />
  </div>
</template>

<script setup>
// This starter template is using Vue 3 <script setup> SFCs
// Check out https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup
import { ref, watchEffect } from 'vue'
import { useRouter } from 'vue-router'
//import HelloWorld from './components/HelloWorld.vue'
import { getAuth, onAuthStateChanged, signOut } from "firebase/auth"
const router = useRouter()
const isLoggedIn = ref(true)
const auth = getAuth();
onAuthStateChanged(auth, (user) => {
  if (user) {
    // User is signed in, see docs for a list of available properties
    // https://firebase.google.com/docs/reference/js/firebase.User
    //const uid = user.uid;
    // ...
    isLoggedIn.value = true // if we have a user
  } else {
    // User is signed out
    // ...
    isLoggedIn.value = false // if we do not
  }
});
const logout = () => {
  signOut(auth).then(() => {
    // Sign-out successful
    router.push('/')
  }).catch((error) => {
    // An error happened.
    const errorCode = error.code;
    const errorMessage = error.message;
    console.log(errorCode,errorMessage)
  });
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
