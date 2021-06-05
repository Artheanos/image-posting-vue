<template>
  <div class="page-404">
    <div class="message">
      <span style="font-size: 5rem">
        404
        PAGE NOT FOUND
      </span>
      <hr/>
      <span>
        We could not find <code>{{ this.$route.fullPath }}</code>
      </span>
    </div>
  </div>
</template>

<style>
.page-404 {
  text-align: center;
  width: 100%;
  height: 100vh;
}

.message {
  width: 100%;
  /*display: flex;*/
  /*flex-direction: column;*/
  /*justify-content: center;*/
  position: relative;
  top: 30%;
}
</style>