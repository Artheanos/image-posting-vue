<template>
  <div>
    <md-dialog-confirm
        :md-active.sync="deleteActive"
        md-title="Are you sure yuo want to delete this image?"
        md-content="You <b>cannot</b> go back"
        md-confirm-text="Delete"
        md-cancel-text="Go back"
        @md-confirm="onConfirm"/>

    <md-card class="image-single">
      <md-card-header>
        <div class="md-title">{{ post.header }}</div>
        <div class="md-subhead">{{ post.created_at }}</div>
      </md-card-header>

      <md-card-media>
        <a :href="post.image" target="_blank"><img :src="post.image" :alt="post.header"/></a>
      </md-card-media>

      <md-card-expand>
        <md-card-actions md-alignment="space-between">
          <div>
            <md-button class="md-icon-button" @click="deleteActive = true">
              <md-icon>delete</md-icon>
            </md-button>
          </div>

          <md-card-expand-trigger>
            <md-button class="md-icon-button" @mousedown="expandComments">
              <md-icon>keyboard_arrow_down</md-icon>
            </md-button>
          </md-card-expand-trigger>
        </md-card-actions>

        <md-card-expand-content>
          <md-card-content>
            <image-comment-form :post_id="post.id" @updateComments="updateComments"/>
            <image-comment v-for="comment in comments" :key="comment.id" :comment="comment"
                           @updateComments="updateComments"/>
          </md-card-content>
        </md-card-expand-content>
      </md-card-expand>

    </md-card>
    <md-snackbar :md-active.sync="deleted">Deleted successfully!</md-snackbar>
  </div>
</template>

<script>
import axios from "axios";
import {routesBuilder} from "../../routesBuilder";
import ImageComment from "./comment/image-comment";
import ImageCommentForm from "./comment/image-comment-form";
import {formatDate} from "../../utils/general";

export default {
  components: {ImageCommentForm, ImageComment},
  props: ['post'],
  beforeMount() {
    this.post.created_at = formatDate(this.post.created_at)
  },
  data: () => ({
    deleteActive: false,
    deleted: false,
    comments: [],
    commentsLoaded: false,
  }),
  methods: {
    async onConfirm() {
      await this.deleteImage()
      this.deleted = true
      this.$emit('updatePosts')
    },
    async deleteImage() {
      console.log(await axios.delete(routesBuilder.api.imagePosts.edit(this.post.id)));
    },
    async updateComments() {
      const detailedPost = (await axios.get(routesBuilder.api.imagePosts.edit(this.post.id))).data;
      this.comments = detailedPost.comments;
      this.commentsLoaded = true;
    },
    expandComments() {
      if (this.commentsLoaded) {
        return
      }
      this.updateComments()
    }
  },
}
</script>

<style>
.image-single {
  max-width: 500px;
  margin-bottom: 4rem;
}
</style>