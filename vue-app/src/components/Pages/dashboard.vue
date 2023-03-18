<script type="js">
import { Bar, Chart } from 'vue-chartjs'
import dropdown from '../Reusables/dropdown.vue'
import { dataService } from '../../services/service.js'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'
ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend)

const backgroundColor = [
    'rgba(255, 99, 132, 0.2)',
    'rgba(54, 162, 235, 0.2)',
    'rgba(255, 206, 86, 0.2)',
    'rgba(75, 192, 192, 0.2)',
    'rgba(153, 102, 255, 0.2)',
    'rgba(255, 159, 64, 0.2)',
]

const borderColor = [
    'rgba(255,99,132,1)',
    'rgba(54, 162, 235, 1)',
    'rgba(255, 206, 86, 1)',
    'rgba(75, 192, 192, 1)',
    'rgba(153, 102, 255, 1)',
    'rgba(255, 159, 64, 1)',
]

const data = {
    labels: [],
    datasets: [{
        data: [],
        label: 'Your Spending at A Glance',
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        borderWidth: 1,
    }],
}

export default {
    name: 'Dashboard',
    components: {
        BarChart: Bar,
        dropdown: dropdown
    },
    data() {
        return {
            data: data,
            options: {
                responsive: true,
                maintainAspectRatio: false,
            },
            service: new dataService(),
            data_ready: false,
            date_range: [],
            start_date: '',
            end_date: '',
            spending: [],
            start: 'Start',
            end: 'End'
        }
    },
    beforeMount() {
        this.getSpending()
    },
    methods: {
        async getSpending() {
            this.spending = await this.service.getSpending()
            this.spending.forEach(elem => {
                const formattedDate = this.service.formatDateToString(elem.record_time)
                this.data.labels.push(formattedDate)
                this.date_range.push(formattedDate)
                this.data.datasets[0].data.push(elem.amount)
            });
            this.data_ready = true
            this.start_date = this.date_range[0]
            this.end_date = this.date_range[this.date_range.length - 1]
        },
        async getSpendingByDate() {
            this.spending = await this.service.getSpendingByDate(this.start_date, this.end_date)
            this.data = {
                labels: [],
                datasets: [{
                    data: [],
                    label: 'Your Spending at a glance',
                    backgroundColor: backgroundColor,
                    borderColor: borderColor,
                    borderWidth: 1,
                }],
            }
            this.spending.forEach(elem => {
                const formattedDate = this.service.formatDateToString(elem.record_time)
                this.data.labels.push(formattedDate)
                this.data.datasets[0].data.push(elem.amount)
            });
            this.data_ready = true
        },
        selectedDate(date, type) {
            if (type === 'Start') {
                this.start_date = date
            } else {
                const start = this.service.formatDateToEpoch(this.start_date)
                const end = this.service.formatDateToEpoch(date)
                if (end < start) return alert('End date cannot be before start date')
                this.end_date = date
            }
            this.getSpendingByDate()
        }
    }
}
</script>

<template>
    <div class="flex items-center px-6">
        <span class="mr-5 text-base text-neutral-600">Date Range</span>
        <dropdown :data_range="date_range" :date_type="start" @selectedDate="selectedDate"></dropdown>
        <dropdown :data_range="date_range" :date_type="end" @selectedDate="selectedDate"></dropdown>
    </div>
    <div v-if="data_ready" class="mb-10 px-10 mt-10 md:mt-28 h-[30rem] w-full">
        <bar-chart :data="data" :options="options"></bar-chart>
    </div>
</template>