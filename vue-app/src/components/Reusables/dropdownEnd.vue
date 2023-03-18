<script lang="js">
import { Menu, MenuButton, MenuItem, MenuItems } from '@headlessui/vue'
import { ChevronDownIcon } from '@heroicons/vue/20/solid'
export default {
    name: 'Dropdown',
    props: ['data_range'],
    components: {
        Menu,
        MenuButton,
        MenuItem,
        MenuItems,
        ChevronDownIcon,
    },
    methods: {
        selectDate(date) {
            this.$emit('selectedDate', date)
        },
    },
}
</script>

<template>
    <Menu as="div" class="relative inline-block text-left">
        <div>
            <MenuButton
                class="inline-flex w-full justify-center gap-x-1.5 rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50">
                End Date
                <ChevronDownIcon class="-mr-1 h-5 w-5 text-gray-400" aria-hidden="true" />
            </MenuButton>
        </div>
        <transition enter-active-class="transition ease-out duration-100" enter-from-class="transform opacity-0 scale-95"
            enter-to-class="transform opacity-100 scale-100" leave-active-class="transition ease-in duration-75"
            leave-from-class="transform opacity-100 scale-100" leave-to-class="transform opacity-0 scale-95">
            <MenuItems
                class="absolute right-0 z-10 mt-2 w-56 origin-top-right rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none max-h-28 overflow-scroll">
                <div>
                    <div @click="selectDate(date)" v-for="date in data_range" :key="date" class="hover:bg-slate-50 text-gray-900 block px-4 py-3 text-sm">
                        <div>{{ date }}</div>
                    </div>
                </div>
            </MenuItems>
        </transition>
    </Menu>
</template>
  
