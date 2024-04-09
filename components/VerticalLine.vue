<script setup lang="ts">
const props = defineProps({
  height: { type: String, default: '10px' },
  class: { type: String, default: '' }
})
</script>

<template>
  <span :style="{ height: `${props.height}` }" :class="'vertical-line ' + $props.class" />
</template>

<style>
.vertical-line {
  border: 0.5px solid white;
  content: '';
  display: inline-block;
  position: absolute;
  width: 1px;
}
</style>
