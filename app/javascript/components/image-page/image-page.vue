<template>
  <layout>
    <div class="image-page">
      <div class="container">
        <image-form @updatePosts="loadNewPosts" v-if="loggedIn"/>
        <div class="images">
          <div style="text-align: center">
            <rotating-icon @click="loadNewPosts" :active="loading" v-if="this.posts.length > 0"/>
            <!--            <md-button class="md-icon-button" @click="loadNewPosts" v-if="this.posts.length > 0">-->
            <!--              <md-icon class="icon-rotatable" v-bind:class="{'icon-rotating': loading}">refresh</md-icon>-->
            <!--            </md-button>-->
          </div>
          <image-single v-for="post in this.posts" :key="post.id" :post="post" @removePost="removePost"/>
          <div class="bottom-loading">
            <md-progress-spinner md-mode="indeterminate" v-if="loading"/>
            <div v-else-if="reachedEnd">
              You've reached the end
            </div>
            <div v-else>
              <md-icon>
                arrow_downward
              </md-icon>
            </div>
          </div>
        </div>
      </div>
      <md-snackbar :md-active.sync="upToDate">You are up to date!</md-snackbar>
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
import {arrayRemove} from "../../utils/general";
import RotatingIcon from "../common/rotating-icon";

export default {
  components: {RotatingIcon, ImageSingle, ImageForm, Layout},
  data: function () {
    return {
      posts: [],
      page: 0,
      loggedIn: loggedIn(),
      reachedBottom: false,
      reachedEnd: false,
      loading: false,
      upToDate: false,
    }
  },
  methods: {
    addPosts() {
      this.loading = true
      this.page++
      axios.get(routesBuilder.api.imagePosts.page(this.page)).then(res => {
        if (res.data.length > 0) {
          this.posts = this.posts.concat(res.data)
        } else {
          this.page--
          this.reachedEnd = true
        }
        this.loading = false
      })
    },
    loadNewPosts() {
      this.loading = true
      this.upToDate = false
      axios.get(routesBuilder.api.imagePosts.after(this.posts[0].id)).then(res => {
        if (res.data.length > 0) {
          this.posts.unshift(...res.data)
        } else {
          this.upToDate = true
        }
        this.loading = false
      })
    },
    onReachBottom() {
      this.addPosts()
    },
    removePost(id) {
      arrayRemove(this.posts, post => post.id === id)
    }
  },

  beforeMount() {
    this.addPosts(1)
  },

  mounted() {
    const scroller = document.querySelector('.md-app-scroller');
    scroller.onscroll = (e) => {
      this.reachedBottom = scroller.scrollHeight - scroller.offsetHeight <= scroller.scrollTop
      if (this.reachedBottom) {
        this.onReachBottom()
      }
    }
  }
}
</script>

<style lang="scss">
.bottom-loading {
  text-align: center;
  height: 5rem;
}

.image-page {
  display: flex;
  width: 100%;
  justify-content: center;

  .container {
    display: flex;
    flex-direction: column;
    max-width: 500px;
  }

  @media (min-width: 768px) {
    .container {
      max-width: 100%;
      flex-direction: row;

      .images {
        max-width: 500px;
      }
    }
  }
}

</style>
