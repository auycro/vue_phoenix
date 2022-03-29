<template>
  Feed
</template>

<script setup>
  import { useRouter } from 'vue-router'
  import { onBeforeUnmount } from 'vue'
  import { getAuth, onAuthStateChanged } from "firebase/auth"
  import axios, { AxiosPromise } from 'axios';

  const router = useRouter()
  const auth = getAuth();
  const authListener = onAuthStateChanged(auth, (user) => {
    if (!user) { // not logged in
      alert('you must be logged in to view this. redirecting to the home page')
      router.push('/')
    }
    
    user.getIdToken().then((token)=>{
      console.log(token)
    });
  })

  axios.get('http://0.0.0.0:4000/api/v1/'+'users').then((response)=>{
    console.log(response);
  }).catch((error)=>{
    console.log(`Error! HTTP Status: ${error}`);
  });
  
  onBeforeUnmount(() => {
    // clear up listener
    authListener()
  })
</script>