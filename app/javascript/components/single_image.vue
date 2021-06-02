<template>
  <div class="md-card">
    <div class="md-card-media">
      <img :src="post.image" :alt="post.header"/>
    </div>
    <div class="md-card-header">
      <div class="md-title">{{ post.header }}</div>
    </div>
  </div>
</template>


<script>
export default {
  props: ['post']
}
</script>