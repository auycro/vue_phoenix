<template>
  Sign Up

  <h1>Create an Account</h1>
  <p><input type="text" placeholder="Email" v-model="email" /></p>
  <p><input type="password" placeholder="Password" v-model="password" /></p>
  <p><button @click="signUp">Submit</button></p>
</template>

<script setup>
  import { ref } from 'vue'
  import { useRouter } from 'vue-router' // import router
  import { getAuth, createUserWithEmailAndPassword } from "firebase/auth";
  
  const email = ref('')
  const password = ref('')
  const router = useRouter() // get a reference to our vue router
  const signUp = () => {
    const auth = getAuth();
    createUserWithEmailAndPassword(auth, email.value, password.value)
    .then((userCredential) => {
      // Signed in 
      //const user = userCredential.user;
      //console.log(user)
      console.log('Successfully registered!');
      router.push('/feed')
    })
    .catch((error) => {
      const errorCode = error.code;
      const errorMessage = error.message;
      console.log(errorCode,errorMessage)
    });
  }
</script>
 