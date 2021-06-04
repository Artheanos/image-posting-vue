<template>
  <div class="input-comment-form">
    <form @submit.prevent="handleSubmit">
      <md-field>
        <label>Content</label>
        <md-input v-model="form.content"/>
      </md-field>
      <md-button class="md-primary" type="submit">Comment</md-button>
    </form>
  </div>
</template>

<script>
import axios from "axios";
import {routesBuilder} from "../../../routesBuilder";

export default {
  props: ['post_id'],
  data() {
    return {
      form: {
        content: '',
        image_post_id: this.post_id
      }
    }
  },
  methods: {
    async handleSubmit() {
      await axios.post(routesBuilder.api.comments.root, {comment: this.form})
      this.$emit('updateComments')
      this.form.content = ''
    },
  }
}
</script>

<style>
.input-comment-form {
  padding: 1rem 3rem;
  margin-bottom: 2rem;
}
</style>
