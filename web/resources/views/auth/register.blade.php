@extends('layouts.app')

<div>
  <div class="min-h-screen flex flex-col items-center justify-center">
    <div class="grid md:grid-cols-2 items-center gap-4 max-md:gap-8 max-w-6xl max-md:max-w-lg w-full p-4 m-4 shadow-[0_2px_10px_-3px_rgba(6,81,237,0.3)] rounded-md">
      <div class="md:max-w-md w-full px-4 py-4">
        <form method="POST" action="{{ route('register') }}">
          @csrf
          <div class="mb-12">
              <h3 class="text-gray-800 text-3xl font-extrabold">Register</h3>
              <p class="text-sm mt-4 text-gray-800">Already have an account? 
                  <a href="{{ route('login-form') }}" class="text-[#45C47C] font-semibold hover:underline ml-1 whitespace-nowrap">Sign in here</a>
              </p>
          </div>
      
          <div>
              <label class="text-gray-800 text-xs block mb-2">Username</label>
              <div class="relative flex items-center">
                  <input name="username" type="text" required class="w-full text-gray-800 text-sm border-b border-gray-300 focus:border-[#45C47C] px-2 py-3 outline-none" placeholder="Enter username" />
                  <i class="fas fa-user absolute right-2 text-gray-400"></i>
              </div>
          </div>
      
          <div class="mt-8">
              <label class="text-gray-800 text-xs block mb-2">Email</label>
              <div class="relative flex items-center">
                  <input name="email" type="email" required class="w-full text-gray-800 text-sm border-b border-gray-300 focus:border-[#45C47C] px-2 py-3 outline-none" placeholder="Enter email" />
                  <i class="fas fa-envelope absolute right-2 text-gray-400"></i>
              </div>
          </div>
      
          <div class="mt-8">
              <label class="text-gray-800 text-xs block mb-2">Phone Number</label>
              <div class="relative flex items-center">
                  <input name="phone_number" type="text" required class="w-full text-gray-800 text-sm border-b border-gray-300 focus:border-[#45C47C] px-2 py-3 outline-none" placeholder="Enter phone number" />
                  <i class="fas fa-phone absolute right-2 text-gray-400"></i>
              </div>
          </div>
      
          <div class="mt-8">
              <label class="text-gray-800 text-xs block mb-2">Password</label>
              <div class="relative flex items-center">
                  <input id="password" name="password" type="password" required class="w-full text-gray-800 text-sm border-b border-gray-300 focus:border-[#45C47C] px-2 py-3 outline-none" placeholder="Enter password" />
                  <i id="toggle-password" class="fas fa-eye absolute right-2 text-gray-400 cursor-pointer"></i>
              </div>
          </div>
      
          <div class="mt-12">
              <button type="submit" class="w-full shadow-xl py-2.5 px-4 text-sm tracking-wide rounded-md text-white bg-[#45C47C] hover:bg-green-500 focus:outline-none">
                  Register
              </button>
          </div>
      </form>
      
      </div>

      <div class="md:h-full bg-[#45C47C] rounded-xl lg:p-12 p-8">
        <img src="https://readymadeui.com/signin-image.webp" class="w-full h-full object-contain" alt="login-image" />
      </div>
    </div>
  </div>
</div>

<script>
  const togglePassword = document.querySelector('#toggle-password');
  const password = document.querySelector('#password');

  togglePassword.addEventListener('click', function () {
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    this.classList.toggle('fa-eye');
    this.classList.toggle('fa-eye-slash');
  });
</script>
