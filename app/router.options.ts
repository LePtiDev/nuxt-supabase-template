import type { RouterConfig } from '@nuxt/schema';

export default <RouterConfig>{
  routes: (_routes) => [
    {
      name: 'home',
      path: '/',
      component: () => import('~/app.vue').then((r) => r.default || r),
    },
  ],
};
