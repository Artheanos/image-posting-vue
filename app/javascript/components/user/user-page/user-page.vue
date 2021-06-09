<template>
  <layout>
    <div class="user-page">
      <md-list>
        <md-list-item>
          <span>Email</span>
          <span>{{ user.email }}</span>
        </md-list-item>
        <md-list-item>
          <span>Joined</span>
          <span>{{ formatDate(user.created_at) }}</span>
        </md-list-item>
        <md-list-item>
          <span>Posts</span>
          <span>{{ user.post_count }}</span>
        </md-list-item>
        <md-list-item>
          <span>Comments</span>
          <span>{{ user.comment_count }}</span>
        </md-list-item>
      </md-list>
    </div>
  </layout>
</template>

<script>
import axios from "axios";
import {routesBuilder} from "../../../routesBuilder";
import Layout from '../../bar-test';
import {formatDate} from "../../../utils/general";

export default {
  components: {Layout},
  data() {
    return {
      formatDate,
      user: {}
    }
  },
  methods: {
    updateUser() {
      axios.get(routesBuilder.api.users.edit(this.$route.params.id)).then(res => {
        this.user = res.data
      })
    }
  },
  beforeMount() {
    this.updateUser()
  }
}
</script>
<style>
.user-page {
  max-width: 500px;
}
</style>