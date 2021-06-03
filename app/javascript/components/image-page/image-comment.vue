<template>
  <div class="image-comment" style="display: flex; justify-content: space-between">
    <div>{{ comment.content }}</div>
    <md-button class="md-icon-button" @click="deleteComment">
      <md-icon>delete</md-icon>
    </md-button>
  </div>
</template>

<script>
import axios from "axios";
import {routesBuilder} from "../../routesBuilder";

export default {
  props: ['comment'],
  methods: {
    async deleteComment() {
      await axios.delete(routesBuilder.api.comments.edit(this.comment.id))
      this.$emit('updateComments')
    }
  }
}
</script>