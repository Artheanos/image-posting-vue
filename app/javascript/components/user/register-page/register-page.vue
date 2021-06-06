<template>
  <layout>
    <div class="register-page">
      <register-form/>
    </div>
  </layout>
</template>

<script>
import Layout from '../../bar-test'
import RegisterForm from './register-form';

export default {
  components: {RegisterForm, Layout}
}
</script>
