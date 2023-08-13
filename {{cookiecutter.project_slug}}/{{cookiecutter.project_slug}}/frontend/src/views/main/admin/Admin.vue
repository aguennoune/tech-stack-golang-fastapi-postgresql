<template>
    <router-view></router-view>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import { store } from '@/store';
import { readHasAdminAccess } from '@/store/main/getters';
import { Route } from 'vue-router';

const routeGuardAdmin = async (to: Route, from: Route, next: Function) => {
  if (!readHasAdminAccess(store)) {
    next('/main');
  } else {
    next();
  }
};

@Component
export default class Admin extends Vue {
  public beforeRouteEnter(to: Route, from: Route, next: Function) {
    routeGuardAdmin(to, from, next);
  }

  public beforeRouteUpdate(to: Route, from: Route, next: Function) {
    routeGuardAdmin(to, from, next);
  }
}
</script>
