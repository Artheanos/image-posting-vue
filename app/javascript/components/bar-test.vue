<template>
  <div class="page-container">
    <md-app md-mode="fixed" style="min-height: 100vh">
      <md-app-toolbar class="md-black-green-dark">
        <md-button class="md-icon-button" @click="menuVisible = !menuVisible">
          <md-icon>menu</md-icon>
        </md-button>
        <span class="md-title">Image Posting with Vue</span>
      </md-app-toolbar>

      <md-app-drawer :md-active.sync="menuVisible">
        <md-toolbar class="md-transparent" md-elevation="0">Navigation</md-toolbar>

        <md-list>
          <md-list-item :to="routesBuilder.home" exact>
            <md-icon>home</md-icon>
            <span class="md-list-item-text">Home</span>
          </md-list-item>

          <md-list-item :to="routesBuilder.auth.login">
            <md-icon>person</md-icon>
            <span class="md-list-item-text">{{
              loggedIn ? "Switch User" : "Login"
            }}</span>
          </md-list-item>

          <md-list-item :to="routesBuilder.auth.register" v-if="!loggedIn">
            <md-icon>person_add</md-icon>
            <span class="md-list-item-text">Register</span>
          </md-list-item>

          <md-list-item :to="routesBuilder.auth.logout" v-if="loggedIn">
            <md-icon>delete</md-icon>
            <span class="md-list-item-text">Logout</span>
          </md-list-item>
        </md-list>
      </md-app-drawer>

      <md-app-content>
        <slot/>
      </md-app-content>
    </md-app>
  </div>
</template>

<style lang="scss" scoped>
.md-app {
  max-height: 100vh;
  border: 1px solid rgba(#000, 0.12);
}

// Demo purposes only
.md-drawer {
  width: 230px;
  max-width: calc(100vw - 125px);
}
</style>

<script>
import {loggedIn} from "../utils/auth";
import {routesBuilder} from "../routesBuilder";

export default {
  data: () => ({
    menuVisible: false,
    loggedIn: loggedIn(),
    routesBuilder
  }),
};
</script>