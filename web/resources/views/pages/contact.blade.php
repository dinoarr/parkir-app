@extends('layouts.nav_landing')

<!-- This form uses the fabform.io form backend service -->

<div class="relative flex items-top justify-center min-h-screen bg-white sm:items-center sm:pt-0">
    <div class="max-w-6xl mx-auto sm:px-6 lg:px-8">
        <div class="mt-8 overflow-hidden">
            <div class="grid grid-cols-1 md:grid-cols-2">
                <div class="p-6 mr-2 bg-gray-100 sm:rounded-lg">
                    <h1 class="text-4xl sm:text-5xl text-gray-800  font-extrabold tracking-tight">
                        Get in touch
                    </h1>
                    <p class="text-normal text-lg sm:text-2xl font-medium text-gray-600  mt-2">
                        Fill in the form to start a conversation
                    </p>

                    <div class="flex items-center mt-8 text-gray-600">
                        <!-- Address information here -->
                    </div>

                    <div class="flex items-center mt-4 text-gray-600">
                        <i class="fas fa-phone text-2xl"></i>
                        <div class="ml-4 text-md tracking-wide font-semibold w-40">
                            +62
                        </div>
                    </div>

                    <div class="flex items-center mt-4 text-gray-600">
                        <i class="fas fa-envelope text-2xl"></i>
                        <div class="ml-4 text-md tracking-wide font-semibold w-40">
                            email@email.com
                        </div>
                    </div>
                </div>

                <form action="https://fabform.io/f/xxxxx" method="post" class="p-6 flex flex-col justify-center">
                    <div class="flex flex-col">
                        <label for="name" class="hidden">Full Name</label>
                        <input type="name" name="name" id="name" placeholder="Full Name" class="w-100 mt-2 py-3 px-3 rounded-lg bg-white border border-gray-400 text-gray-800 font-semibold focus:border-indigo-500 focus:outline-none">
                    </div>

                    <div class="flex flex-col mt-2">
                        <label for="email" class="hidden">Email</label>
                        <input type="email" name="email" id="email" placeholder="Email" class="w-100 mt-2 py-3 px-3 rounded-lg bg-white border border-gray-400 text-gray-800 font-semibold focus:border-indigo-500 focus:outline-none">
                    </div>

                    <div class="flex flex-col mt-2">
                        <label for="message" class="hidden">Message</label>
                        <textarea name="message" id="message" placeholder="Your Message" class="resize-none w-100 mt-2 py-3 px-3 rounded-lg bg-white border border-gray-400 text-gray-800 font-semibold focus:border-indigo-500 focus:outline-none"></textarea>
                    </div>

                    <button type="submit" class="md:w-32 bg-[#45C57C] flex justify-evenly items-center text-white font-bold py-3 px-6 rounded-lg mt-3 hover:bg-green-500 transition ease-in-out duration-300">
                        Send <i class="fas fa-paper-plane"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

@include('layouts.footer_landing')