<template>
  <div id="image_page">
    <image-form @updatePosts="updatePosts"></image-form>
    <div class="md-content">
      <image-single v-for="post in this.posts" :key="post.id" :post="post" @updatePosts="updatePosts"/>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import {routesBuilder} from "../../routesBuilder";
import ImageForm from './image-form'
import ImageSingle from './image-single'

export default {
  components: {ImageSingle, ImageForm},
  data: function () {
    return {
      posts: [],
    }
  },
  methods: {
    updatePosts: function () {
      axios.get(routesBuilder.api.imagePosts.root).then(res => {
        this.posts = res.data;
      })
    },
  },
  beforeMount() {
    this.updatePosts()
  }
}
</script>
