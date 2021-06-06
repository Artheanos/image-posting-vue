<template>
  <md-content class="image-comment" style="display: flex; justify-content: space-between">
    <div>{{ comment.content }}</div>
    <md-button class="md-icon-button" @click="deleteComment" v-if="isOwner">
      <md-icon>delete</md-icon>
    </md-button>
  </md-content>
</template>

<script>
import axios from "axios";
import {routesBuilder} from "../../../routesBuilder";
import {authConfig, getUserId} from "../../../utils/auth";

export default {
  props: ['comment'],
  data() {
    return {
      isOwner: getUserId() === this.comment.user_id
    }
  },
  methods: {
    async deleteComment() {
      await axios.delete(routesBuilder.api.comments.edit(this.comment.id), authConfig())
      this.$emit('updateComments')
    },
  }
}
</script>

<style>
.image-comment {
  box-shadow: 0 3px 1px -2px rgba(0, 0, 0, .2), 0 2px 2px 0 rgba(0, 0, 0, .14), 0 1px 5px 0 rgba(0, 0, 0, .12);
  margin: 1rem 0;
  padding: 1rem;
}
</style>