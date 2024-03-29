<template>
  <div
    class="grid max-w-2xl grid-cols-1 mx-auto gap-y-6 lg:gap-y-20 gap-x-8 lg:mx-0 lg:max-w-none lg:grid-cols-2 lg:pr-8">
    <article v-for="project in projects" :key="project.id"
      class="max-w-xl">
      <div class="">
        <video v-if="!!project.videoUrl"
          :ref="`video${project.id}`" muted loop
          @mouseenter="playVideo(project.id)"
          @mouseleave="pauseVideo(project.id)"
          class="object-cover w-full h-48 rounded-lg"
          :poster="project.imageUrl.src"
          :src="project.videoUrl" type="video/mp4" />
        <img v-else :src="project.imageUrl.src" alt=""
          class="object-cover w-full h-48 rounded-lg" />
      </div>
      <div class="relative mt-2">
        <p class="mt-5 text-xs text-gray-500"
          v-text="project.date" />
        <h3
          class="font-semibold leading-6 text-gray-200 text-md group-hover:text-gray-100 hover:underline decoration-2 decoration-sky-500">
          <a :href="project.href" target="blank"
            v-text="project.title" />
        </h3>
        <p class="mt-2 text-sm leading-6 text-gray-400"> {{
          project.description }}</p>
      </div>
      <!-- <div class="flex flex-wrap items-center gap-2 mt-2">
          <span v-for="category, i in project.categories" :key="i"  class="text-xs relative z-10 rounded-full bg-gray-800 py-1 px-2.5 font-medium text-gray-300">{{
            category }}</span>
        </div> -->
    </article>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import pantari from "../assets/videos/pantari.mp4";
import businessmodelnavigator from "../assets/videos/businessmodelnavigator.mp4";
import vatAutomation from "../assets/videos/vat-automation.mp4";
import superpowers from "../assets/images/superpowers.webp";
import pantariImg from "../assets/images/pantari.webp";
import businessmodelnavigatorImg from "../assets/images/businessmodelnavigator.webp";
import vatAutomationImg from "../assets/images/vat-automation.webp";

const video1 = ref(null);
const video3 = ref(null);
const video4 = ref(null);


function playVideo(projectId: Number) {
  if (projectId === 1 && !!video1.value) {
    video1.value[0].play();
  } else if (projectId === 3 && !!video3.value) {
    video3.value[0].play();
  } else if (projectId === 4 && !!video4.value) {
    video4.value[0].play();
  }
}

function pauseVideo(projectId: Number) {
  if (projectId === 1 && !!video1.value) {
    video1.value[0].pause();
  } else if (projectId === 3 && !!video3.value) {
    video3.value[0].pause();
  } else if (projectId === 4 && !!video4.value) {
    video4.value[0].pause();
  }
}


const projects = [
  {
    id: 1,
    title: 'Pantari.io',
    href: 'https://pantari.io',
    description:
      'A webapp for businesses to manage their waiting queues. Customers can register from their phones and get real-time updates on status and waiting times.',
    imageUrl: pantariImg,
    videoUrl: pantari,
    date: '2022',
    datetime: '2020-03-16',
    // categories: ['Vue', 'TypeScript', 'SQL', 'Supabase', 'TailwindCSS'],
  },
  {
    id: 2,
    title: 'Superpowers',
    href: 'https://github.com/TM312/superpowers',
    description:
      'A PoC for a composable API that executes sequences of function based on the request input. The API is designed as a modular set of serverless functions and therefore easily extensible.',
    imageUrl: superpowers,
    videoUrl: null,
    date: '2021',
    datetime: '2021',
    // categories: ['Supabase'],
  },
  {
    id: 3,
    title: 'Vat automation',
    href: 'https://github.com/TM312/vat_automation',
    description:
      'A web tool to automate VAT calculations and track sales for Amazon sellers. To cater the tool to user needs I collaborated with a leading Dutch VAT advisory and Amazon sellers.',
    imageUrl: vatAutomationImg,
    videoUrl: vatAutomation,
    date: '2020',
    // categories: ['Supabase'],
  },
  {
    id: 4,
    title: 'BusinessModelNavigator.com',
    href: 'https://businessmodelnavigator.com',
    description:
      'An educational webtool to stimulate corporate ideation processes. After gaining initial traction we sold it to the Swiss innovation consultancy BMI Lab.',
    imageUrl: businessmodelnavigatorImg,
    videoUrl: businessmodelnavigator,
    date: '2018',
    // categories: ['Supabase'],
  },

]
</script>