<template>
  <layout>
    <div class="login-page">
      <login-form/>
    </div>
  </layout>
</template>

<script>
import Layout from '../../bar-test'
import LoginForm from './login-form';

export default {
  components: {LoginForm, Layout}
}
</script>
