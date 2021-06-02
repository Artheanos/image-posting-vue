<template>
  <div id="image_form">
    <form @submit.prevent="handleSubmit">
      <div class="form-group">
        <input type="text" name="title" class="form-control" id="title" placeholder="Enter Post Title"
               v-model="formData.header">
      </div>
      <div class="form-group">
        <input type="file" name="picture" class="form-control-file" id="picture" @change="onFileChange">
      </div>
      <input type="submit"/>
    </form>
  </div>
</template>

<script>
import axios from 'axios';
import {routesBuilder} from "../routesBuilder";

export default {
  data: function () {
    return {
      formData: {}
    }
  },
  methods: {
    handleSubmit: async function (event) {
      let data = new FormData();
      data.append('image_post[header]', this.formData.header);
      data.append('image_post[image]', this.formData.image);

      await axios.post(routesBuilder.api.imagePosts.root, data);
      this.$emit('updatePosts');
    },
    onFileChange: function (e) {
      this.formData.image = e.target.files[0];
    }
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
