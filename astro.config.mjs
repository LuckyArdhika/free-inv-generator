import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import tailwindcss from '@tailwindcss/vite';

// https://astro.build/config
export default defineConfig({
  site: 'https://quinvy.com',
  base: '/free-invoice-generator/',
  integrations: [sitemap()],
  vite: {
    plugins: [tailwindcss()],
  },
});
