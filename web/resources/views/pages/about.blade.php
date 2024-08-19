@extends('layouts.nav_landing')
<section class="mt-10">
    <div class="2xl:container 2xl:mx-auto lg:py-16 lg:px-20 md:py-12 md:px-6 py-9 px-4">
        <p class="font-semibold text-lg leading-3 text-[#45C57C] hover:text-green-500 pb-2">About</p>
        <div class="flex lg:flex-row flex-col lg:gap-8 sm:gap-10 gap-12">
            <div class="w-full lg:w-6/12">
                <h2 class="w-full font-bold lg:text-4xl text-3xl lg:leading-10 leading-9 text-black">We Make Parking Simple and Accessible for Everyone</h2>
                <p class="font-normal text-base leading-6 text-black mt-6">Our application is designed to simplify the parking experience for both property owners and users. Property owners can easily register their parking spaces and make them available to a wide range of users, while users can quickly find and reserve parking spots based on their needs. We aim to connect parking space providers and users seamlessly through our platform.</p>
            </div>
            <div class="w-full lg:w-6/12">
                <img class="lg:block hidden w-full" src="https://clipground.com/images/image-placeholder-clipart-1.png" alt="Parking illustration" />
                <img class="lg:hidden sm:block hidden w-full" src="https://clipground.com/images/image-placeholder-clipart-1.png" alt="Parking illustration" />
                <img class="sm:hidden block w-full" src="https://clipground.com/images/image-placeholder-clipart-1.png" alt="Parking illustration" />
            </div>
        </div>

        <div class="relative mt-24">
            <div class="grid sm:grid-cols-3 grid-cols-2 sm:gap-8 gap-4">
                <div class="z-20 w-12 h-12 bg-[#45C57C] rounded-full flex justify-center items-center">
                    <i class="fas fa-flag text-white text-xl"></i>
                </div>

                <div class="z-20 w-12 h-12 bg-[#45C57C] rounded-full flex justify-center items-center">
                    <i class="fas fa-users text-white text-xl"></i>
                </div>

                <div class="z-20 w-12 h-12 bg-[#45C57C] rounded-full flex justify-center items-center">
                    <i class="fas fa-building text-white text-xl"></i>
                </div>
            </div>
            <hr class="z-10 absolute top-2/4 w-full bg-black" />
        </div>
        <div class="grid sm:grid-cols-3 grid-cols-2 sm:gap-8 gap-4">
            <div>
                <p class="font-semibold lg:text-2xl text-xl lg:leading-6 leading-5 text-black mt-6">Established</p>
                <p class="font-normal text-base leading-6 text-black mt-6">Since our inception, we have been committed to making parking more accessible and convenient for everyone. Our platform is designed to bridge the gap between parking space providers and users.</p>
            </div>
            <div>
                <p class="font-semibold lg:text-2xl text-xl lg:leading-6 leading-5 text-black mt-6">Community</p>
                <p class="font-normal text-base leading-6 text-black mt-6">With a rapidly growing user base, we are becoming a trusted platform for parking reservations. Our community continues to expand as more users and parking space providers join us.</p>
            </div>
            <div>
                <p class="font-semibold lg:text-2xl text-xl lg:leading-6 leading-5 text-black mt-6">About Our Business</p>
                <p class="font-normal text-base leading-6 text-black mt-6">We empower parking space providers to grow their business by connecting them with a large and diverse user base. Our platform is designed to help you maximize your parking space utilization, reach more customers, and increase your revenue.</p>
            </div>
        </div>

        <div class="flex lg:flex-row flex-col md:gap-14 gap-16 justify-between lg:mt-20 mt-16">
            <div class="w-full lg:w-6/12">
                <h2 class="font-bold lg:text-4xl text-3xl lg:leading-9 leading-7 text-black">Our Mission</h2>
                <p class="font-normal text-base leading-6 text-black mt-6 w-full">Our mission is to create a seamless connection between parking space providers and users. We strive to provide an efficient and reliable platform where parking spaces are easy to find, reserve, and manage.</p>
                <p class="font-normal text-base leading-6 text-black w-full mt-10">We are committed to continuously improving our platform to better serve our users and parking space providers, ensuring a smooth and convenient parking experience for all.</p>
            </div>
        </div>
    </div>
<section>

@include('layouts.footer_landing');
