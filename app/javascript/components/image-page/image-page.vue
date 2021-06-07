<template>
  <layout>
    <div class="image-page">
      <div class="container">
        <image-form @updatePosts="updatePosts" v-if="loggedIn"/>
        <div class="images">
          <image-single v-for="post in this.posts" :key="post.id" :post="post" @updatePosts="updatePosts"/>
        </div>
      </div>
    </div>
  </layout>
</template>

<script>
import axios from "axios";
import {routesBuilder} from "../../routesBuilder";
import {loggedIn} from "../../utils/auth";
import ImageForm from './image-form'
import ImageSingle from './image-single'
import Layout from '../bar-test';

export default {
  components: {ImageSingle, ImageForm, Layout},
  data: function () {
    return {
      posts: [],
      loggedIn: loggedIn()
    }
  },
  methods: {
    updatePosts: function () {
      axios.get(routesBuilder.api.imagePosts.root).then(res => {
        this.posts = res.data;
      })
    }
  },
  beforeMount() {
    this.updatePosts()
  }
}
</script>

<style lang="scss">
.image-page {
  display: flex;
  width: 100%;
  //flex-direction: row;
  justify-content: center;

  .container {
    display: flex;
    flex-direction: column;
    max-width: 500px;
  }

  @media (min-width: 768px) {
    .container {
      //width: 100%;
      max-width: 100%;
      flex-direction: row;

      .images {
        max-width: 500px;
      }
    }
  }
}
</style>
