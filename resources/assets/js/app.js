
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */
import Echo from "laravel-echo"
import VueResource from "vue-resource"

Vue.use(VueResource);

window.Pusher = require('pusher-js');

window.Echo = new Echo({
    broadcaster: 'pusher',
    key: '298a256e3674cbad81e2' //Add your pusher key here
});

import Chat from './components/Chat.vue'

const app = new Vue({
    el: '#wrapper',
    components: {
        chat: Chat
    }
});





