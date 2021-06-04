<template>
  <layout>
    <div id="image_page">
      <h1>LOL</h1>
      <login-form/>
    </div>
  </layout>
</template>

<script>
import Layout from '../../bar-test'
import LoginForm from './login-form';
import axios from "axios";

export default {
  components: {LoginForm, Layout}
}
</script>
