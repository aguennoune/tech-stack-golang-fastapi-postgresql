<template>
  <router-view></router-view>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import { store } from '@/store';
import { dispatchCheckLoggedIn } from '@/store/main/actions';
import { readIsLoggedIn } from '@/store/main/getters';
import { Route } from 'vue-router';

const startRouteGuard = async (to: Route, from: Route, next: Function) => {
  await dispatchCheckLoggedIn(store);
  if (readIsLoggedIn(store)) {
    if (to.path === '/login' || to.path === '/') {
      next('/main');
    } else {
      next();
    }
  } else if (readIsLoggedIn(store) === false) {
    if (to.path === '/' || (to.path as string).startsWith('/main')) {
      next('/login');
    } else {
      next();
    }
  }
};

@Component
export default class Start extends Vue {
  public beforeRouteEnter(to: Route, from: Route, next: Function) {
    startRouteGuard(to, from, next);
  }

  public beforeRouteUpdate(to: Route, from: Route, next: Function) {
    startRouteGuard(to, from, next);
  }
}
</script>
