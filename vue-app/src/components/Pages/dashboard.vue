<script type="js">
import { Bar, Chart } from 'vue-chartjs'
import dropdown1 from '../Reusables/dropdownStart.vue'
import dropdown2 from '../Reusables/dropdownEnd.vue'
import { dataService } from '../../services/service.js'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'
ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend)

export default {
    name: 'Dashboard',
    components: {
        BarChart: Bar,
        dropdown1: dropdown1,
        dropdown2: dropdown2,
    },
    data() {
        return {
            data: {
                labels: [],
                datasets: [{
                    data: [],
                    label: 'Your Spending at a glance',
                    backgroundColor: '#f56565',
                    borderColor: '#f56565',
                    borderWidth: 1,
                    hoverBackgroundColor: '#f56565',
                    hoverBorderColor: '#f56565',
                }],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
            },
            service: new dataService(),
            data_ready: false,
            date_range: [],
            start_date: '',
            end_date: '',
            spending: []
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
                    backgroundColor: '#f56565',
                    borderColor: '#f56565',
                    borderWidth: 1,
                    hoverBackgroundColor: '#f56565',
                    hoverBorderColor: '#f56565',
                }],
            }
            this.spending.forEach(elem => {
                const formattedDate = this.service.formatDateToString(elem.record_time)
                this.data.labels.push(formattedDate)
                this.data.datasets[0].data.push(elem.amount)
            });
            this.data_ready = true
        },
        selectedStartDate(date) {
            this.start_date = date
            this.getSpendingByDate()
        },
        selectedEndDate(date) {
            if (date < this.start_date) return alert('End date cannot be before start date')
            this.end_date = date
            this.getSpendingByDate()
        }
    }
}
</script>

<template>
    <div class="flex items-center">
        <span class="mr-5">Choose a range here to populate your spending data</span>
        <dropdown1 :data_range="date_range" @selectedDate="selectedStartDate"></dropdown1>
        <dropdown2 :data_range="date_range" @selectedDate="selectedEndDate"></dropdown2>
    </div>
    <div v-if="data_ready" class="mb-10 mt-36 h-56 md:h-96">
        <bar-chart :data="data" :options="options"></bar-chart>
    </div>
</template>