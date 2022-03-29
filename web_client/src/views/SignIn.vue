<template>
  Sign In

  <h1>Login to Your Account</h1>
  <p><input type="text" placeholder="Email" v-model="email" /></p>
  <p><input type="password" placeholder="Password" v-model="password" /></p>
  <p><button @click="signIn">Submit</button></p>
</template>

<script setup>
  import { ref } from 'vue'
  import { useRouter } from 'vue-router' // import router
  import { getAuth, signInWithEmailAndPassword } from "firebase/auth";
  const email = ref('')
  const password = ref('')
  const router = useRouter() // get a reference to our vue router
  const signIn = () => {
    const auth = getAuth();
    signInWithEmailAndPassword(auth, email.value, password.value)
    .then((userCredential) => {
      // Signed in 
      //const user = userCredential.user;
      // ...
      console.log('Successfully logged in!');
      router.push('/feed') // redirect to the feed
    })
    .catch((error) => {
      const errorCode = error.code;
      const errorMessage = error.message;
      console.log(errorCode,errorMessage)
    });
  }
</script>