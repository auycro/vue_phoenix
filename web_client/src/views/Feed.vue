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
    
    user.getIdToken(true).then((token)=>{
      //console.log(token);
      const config = {
          headers: {
              //"Content-type": "application/json",
              "Authorization": `Bearer ${token}`,
          },
      };  

      axios.get('http://0.0.0.0:4000/api/v1/'+'users', config).then((response)=>{
        console.log(response);
      }).catch((error)=>{
        console.log(`Error! HTTP Status: ${error}`);
      });
    });
  })

  onBeforeUnmount(() => {
    // clear up listener
    authListener()
  })
</script>