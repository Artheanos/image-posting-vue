<template>
  <div class="rotating-icon">
    <md-button class="md-icon-button" @click="$emit('click')">
      <md-icon ref="icon" class="icon-rotatable">refresh</md-icon>
    </md-button>
  </div>
</template>
<script>
export default {
  props: ['active'],
  watch: {
    active: function (newVal, oldVal) {
      const icon = this.$refs['icon'].$el
      console.log(icon)
      if (newVal === false) {
        let transformState = getComputedStyle(icon).transform
        icon.classList.remove('icon-rotating')
        icon.style.transform = transformState
        requestAnimationFrame(() => {
          icon.style.transform = 'rotate(0deg)'
        })
      } else {
        icon.classList.add('icon-rotating')
      }
    }
  },
  data() {
    return {}
  },
}
</script>
