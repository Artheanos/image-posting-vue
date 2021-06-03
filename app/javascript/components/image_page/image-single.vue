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
      </md-card-header>
      <md-card-media>
        <img :src="post.image" :alt="post.header"/>
      </md-card-media>
      <md-card-actions>
        <md-button class="md-icon-button" @click="deleteActive = true">
          <md-icon>delete</md-icon>
        </md-button>
      </md-card-actions>
    </md-card>
  </div>
</template>

<script>
export default {
  data: () => ({
    deleteActive: false
  }),
  methods: {
    onConfirm() {
      alert('a');
    },
    deleteImage() {

    }
  },
  props: ['post']
}
</script>

<style>
.image-single {
  max-width: 500px;
  margin-bottom: 4rem;
}
</style>