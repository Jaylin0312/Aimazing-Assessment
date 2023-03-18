<script type="js">
import { Bar } from 'vue-chartjs'
import { dataService } from '../../services/data.js'
import {
    Chart as ChartJS,
    Title,
    Tooltip,
    Legend,
    BarElement,
    CategoryScale,
    LinearScale
} from 'chart.js'
ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend)

export default {
    name: 'Dashboard',
    components: {
        BarChart: Bar
    },
    data() {
        return {
            data: {
                labels: [],
                datasets: [{ data: [] }],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
            },
            data_ready: false
        }
    },
    beforeMount() {
        const service = new dataService()
        this.getSpending(service)
    },
    methods: {
        async getSpending(service) {
            this.spending = await service.getSpending()
            this.spending.sort((a, b) => a.record_time - b.record_time);
            this.spending.forEach(elem => {
                const date = new Date(elem.record_time * 1000);
                const formattedDate = date.toDateString();
                this.data.labels.push(formattedDate)
                this.data.datasets[0].data.push(elem.amount)
                this.data_ready = true
            });
        },
    }
}
</script>

<template>
    <div v-if="data_ready" class="mb-10 h-56 md:h-96">
        <bar-chart :data="data" :options="options"></bar-chart>
    </div>
</template>