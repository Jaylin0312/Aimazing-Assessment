<script lang="js">
import { dataService } from '../../services/service.js'
import Dashboard from './dashboard.vue'

export default {
  name: 'Main',
  components: {
    Dashboard
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
      <div class="mb-4">Welcome {{ this.user }} ! This is your spending dashboard </div>
    </div>
    <Dashboard></Dashboard>
  </div>
</template>
