<template>
  <div class="image-comment" style="display: flex; justify-content: space-between">
    <div>{{ comment.content }}</div>
    <md-button class="md-icon-button" @click="deleteComment" v-if="isOwner">
      <md-icon>delete</md-icon>
    </md-button>
  </div>
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