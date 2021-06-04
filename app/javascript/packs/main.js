// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// require("@rails/ujs").start()
// require("turbolinks").start()
// require("@rails/activestorage").start()
// require("channels")

import Vue from 'vue/dist/vue.esm';
import VueRouter from "vue-router";
import Page404 from '../components/404/page-404'
import App from '../components/app'
import VueMaterial from 'vue-material'
import 'vue-material/dist/vue-material.min.css'
import 'vue-material/dist/theme/default.css'

const router = new VueRouter({
    mode: 'history',
    routes: [
        {path: '/', component: App, name: 'app'},

        {path: '/404', component: Page404, name: 'page'},
        {path: '*', redirect: '/404'}
    ]
});

Vue.use(VueMaterial)
Vue.use(VueRouter)
const app = new Vue({
    router,
}).$mount('#app')

// document.addEventListener('DOMContentLoaded', () => {
//     Vue.use(VueMaterial);
//     const app = new Vue({
//         render: h => h(App)
//     }).$mount()
//     document.body.appendChild(app.$el)
//
//     console.log(app)
// })