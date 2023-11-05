<script setup lang="ts">
const props = defineProps({
  height: { type: Number, default: 10 }
})
</script>

<template>
  <span :style="{ height: `${props.height}px` }" class="vertical-line" />
</template>

<style>
.vertical-line {
  border: 0.5px white solid;
  content: '';
  display: inline-block;
  position: relative;
  width: 1px;
}
</style>
