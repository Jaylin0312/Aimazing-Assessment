<script lang="js">
import { dataService } from '../../services/service.js'
import Dashboard from './dashboard.vue'
import Card from '../Reusables/card.vue'

export default {
  name: 'Main',
  components: {
    Dashboard,
    Card,
  },
  data() {
    return {
      user: null,
    }
  },
  beforeMount() {
    const service = new dataService()
    this.getUser(service)
  },
  methods: {
    async getUser(service) {
      this.user = await service.getUsers()
    },
  },
}
</script>

<template>
  <div class="w-full p-10">
    <div class="mb-4">
      <Card :user="this.user"></Card>
    </div>
    <Dashboard></Dashboard>
  </div>
</template>
