<script>
export default {
    name: 'Card',
    props: ['user'],
}

</script>

<template>
    <div>
        <div class="flex border mb-10 flex-col rounded-lg md:flex-row">
            <div class="flex flex-col justify-start p-6">
                <h5 class="mb-2 text-xl font-medium text-neutral-800">
                    Spending Dashboard
                </h5>
                <p class="mb-4 text-base text-neutral-600">
                    Hello {{this.user}}! Welcome to your spending dashboard. You can select a date range to view your spending data.
                </p>
            </div>
        </div>
    </div>
</template>