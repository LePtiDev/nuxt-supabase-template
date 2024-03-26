<script lang="ts" setup></script>
<template>
  <div>
    <h1>{{ $t('hello', { name: 'Quentin Guerrier' }) }}</h1>
    <form>
      <label for="locale-select">{{ $t('language') }}: </label>
      <select id="locale-select" v-model="$i18n.locale">
        <option value="en">en</option>
        <option value="fr">fr</option>
      </select>
    </form>
  </div>
</template>
