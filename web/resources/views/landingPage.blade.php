@include('layouts.nav_landing');

<section class="bg-white">
    <div class="grid py-8 px-4 mx-auto max-w-screen-xl lg:gap-8 xl:gap-0 lg:py-16 lg:grid-cols-12">
        <div class="place-self-center mr-auto lg:col-span-7">
            <h1 class="mb-4 max-w-2xl text-black text-2xl font-extrabold leading-none md:text-2xl xl:text-4xl">Parking Management Tool for Efficient Parking Solutions</h1>
            <p class="mb-6 max-w-2xl font-light text-gray-800 lg:mb-8 md:text-lg lg:text-xl">From real-time booking to seamless payment processing, parking facilities around the world use our Parking Management App to streamline their operations and enhance the parking experience.</p>
            <a href="#" class="inline-flex justify-center items-center py-3 px-5 mr-3 text-base font-medium text-white  bg-[#45C57C] rounded-lg">
                Get started
                <svg class="ml-2 -mr-1 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
            </a> 
        </div>
        <div class="hidden lg:mt-0 lg:col-span-5 lg:flex">
            <img src="{{asset('mockup.png')}}" class="w-full h-full" alt="mockup">
        </div>                
    </div>
</section>

<section class="bg-white">
    <div class="relative isolate overflow-hidden bg-gray-100 px-6 py-24 sm:py-32 lg:overflow-visible lg:px-0">
        <div class="mx-auto grid max-w-2xl grid-cols-1 gap-x-8 gap-y-16 lg:mx-0 lg:max-w-none lg:grid-cols-2 lg:items-start lg:gap-y-10">
            <div class="-ml-12 -mt-12 p-2 lg:sticky lg:top-4 lg:col-start-2 lg:row-span-2 lg:row-start-2 lg:overflow-hidden">
                <img src="{{asset('illustration.png')}}" class="w-full max-w-none rounded-xl bg-gray-100 shadow-xl drop-shadow-xl ring-1 ring-gray-400/10 sm:w-[57rem]" alt="">
            </div>
            <div class="lg:col-span-2 lg:col-start-1 lg:row-start-2 lg:mx-auto lg:grid lg:w-full lg:max-w-7xl lg:grid-cols-2 lg:gap-x-8 lg:px-8">
                <div class="lg:pr-4">
                    <div class="lg:max-w-lg">
                        <p class="text-base font-semibold leading-7 text-[#45C57C]">Why Choose Us</p>
                        <h1 class="mt-2 text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">Your Parking Solution, Our Commitment</h1>
                    </div>
                    <div class="max-w-xl text-base leading-7 text-gray-700 lg:max-w-lg">
                        <ul role="list" class="mt-8 space-y-8 text-gray-600">
                            <li class="flex gap-x-3">
                                <i class="fas fa-parking mt-1 h-5 w-5 flex-none text-[#45C57C]"></i>
                                <span><strong class="font-semibold text-gray-900">Parkir App</strong> Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores impedit perferendis suscipit eaque, iste dolor cupiditate blanditiis ratione.</span>
                            </li>
                            <li class="flex gap-x-3">
                                <i class="fas fa-parking mt-1 h-5 w-5 flex-none text-[#45C57C]"></i>
                                <span><strong class="font-semibold text-gray-900">Parkir App</strong> Anim aute id magna aliqua ad ad non deserunt sunt. Qui irure qui lorem cupidatat commodo.</span>
                            </li>
                            <li class="flex gap-x-3">
                                <i class="fas fa-parking mt-1 h-5 w-5 flex-none text-[#45C57C]"></i>
                                <span><strong class="font-semibold text-gray-900">Parkir App</strong> Ac tincidunt sapien vehicula erat auctor pellentesque rhoncus. Et magna sit morbi lobortis.</span>
                            </li>
                        </ul>
                        <p class="mt-8">Et vitae blandit facilisi magna lacus commodo. Vitae sapien duis odio id et. Id blandit molestie auctor fermentum dignissim. Lacus diam tincidunt ac cursus in vel. Mauris varius vulputate et ultrices hac adipiscing egestas. Iaculis convallis ac tempor et ut. Ac lorem vel integer orci.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

{{-- carousel --}}
<section class="w-full py-10 md:py-20 lg:py-24">
    <div class="container mx-auto px-4">
        <div class="space-y-3">
            <h2 class="text-3xl font-bold tracking-tighter sm:text-4xl md:text-5xl text-center">Our Partnerships</h2>
            <p class="mx-auto max-w-2xl text-gray-600 md:text-lg lg:text-xl text-center">
                We collaborate with the best global partners to bring innovative solutions worldwide. Here are some of our key partnership locations.
            </p>
            <div class="relative overflow-hidden">
                <div id="carousel" class="flex whitespace-nowrap mx-4 m-5">
                    <!-- Carousel Items -->
                    <div class="min-w-[150px] bg-gray-100 rounded-xl drop-shadow-xl p-6 mx-4 inline-block">
                        <div class="flex justify-center mb-4">
                            <img src="https://placehold.co/80x80" alt="Nama Tempat" class="w-40 h-40 rounded-lg" />
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Nama Tempat</h3>
                        <p class="text-gray-600">Alamat</p>
                    </div>
                    <div class="min-w-[150px] bg-gray-100 rounded-xl drop-shadow-xl p-6 mx-4 inline-block">
                        <div class="flex justify-center mb-4">
                            <img src="https://placehold.co/80x80" alt="Nama Tempat" class="w-40 h-40 rounded-lg" />
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Nama Tempat</h3>
                        <p class="text-gray-600">Alamat</p>
                    </div>
                    <div class="min-w-[150px] bg-gray-100 rounded-xl drop-shadow-xl p-6 mx-4 inline-block">
                        <div class="flex justify-center mb-4">
                            <img src="https://placehold.co/80x80" alt="Nama Tempat" class="w-40 h-40 rounded-lg" />
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Nama Tempat</h3>
                        <p class="text-gray-600">Alamat</p>
                    </div>
                    <div class="min-w-[150px] bg-gray-100 rounded-xl drop-shadow-xl p-6 mx-4 inline-block">
                        <div class="flex justify-center mb-4">
                            <img src="https://placehold.co/80x80" alt="Nama Tempat" class="w-40 h-40 rounded-lg" />
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Nama Tempat</h3>
                        <p class="text-gray-600">Alamat</p>
                    </div>
                    <div class="min-w-[150px] bg-gray-100 rounded-xl drop-shadow-xl p-6 mx-4 inline-block">
                        <div class="flex justify-center mb-4">
                            <img src="https://placehold.co/80x80" alt="Nama Tempat" class="w-40 h-40 rounded-lg" />
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Nama Tempat</h3>
                        <p class="text-gray-600">Alamat</p>
                    </div>
                    <div class="min-w-[150px] bg-gray-100 rounded-xl drop-shadow-xl p-6 mx-4 inline-block">
                        <div class="flex justify-center mb-4">
                            <img src="https://placehold.co/80x80" alt="Nama Tempat" class="w-40 h-40 rounded-lg" />
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Nama Tempat</h3>
                        <p class="text-gray-600">Alamat</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const carousel = document.getElementById('carousel');

        function startCarousel() {
            let scrollStep = 1;
            setInterval(() => {
                carousel.scrollLeft += scrollStep;
                if (carousel.scrollLeft >= carousel.scrollWidth - carousel.clientWidth) {
                    carousel.scrollLeft = 0; 
                }
            }, 1000);
        }

        startCarousel();
    });
</script>

@include('layouts.footer_landing');
