<template>
  <div class="input-comment-form">
    <md-field>
      <label>Content</label>
      <md-input v-model="content"/>
    </md-field>
    <md-button class="md-primary">Comment</md-button>
  </div>
</template>

<script>
export default {
  props: ['postId'],
  data: () => ({
    content: ''
  }),
  methods: {
    handleSubmit() {

    }
  }
}
</script>