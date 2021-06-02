<template>
  <div id="app">
    <image_form @updatePosts="updatePosts"/>
    <div class="md-content">
      <!--      <div v-for="post in this.posts">-->
      <!--        <single_image :post="post"/>-->
      <!--      </div>-->
      <single_image v-for="post in this.posts" :post="post"/>
    </div>
  </div>
</template>

<script>
import Image_form from "./image_form";
import axios from "axios";
import {routesBuilder} from "../routesBuilder";
import Single_image from "./single_image";

export default {
  components: {Single_image, Image_form},
  data: function () {
    return {
      posts: [],
    }
  },
  methods: {
    updatePosts: function () {
      axios.get(routesBuilder.api.imagePosts.root).then(res => {
        this.posts = res.data;
        console.log(res.data);
      })
    },
  },
  beforeMount() {
    this.updatePosts()
  }
}
</script>

<style>
</style>