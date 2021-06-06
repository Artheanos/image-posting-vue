<template>
  <div>Redirecting</div>
</template>
<script>
import {unsetUser} from "../../utils/auth";

export default {
  beforeMount() {
    unsetUser()
    this.$router.push({name: 'home'})
  }
}
</script>