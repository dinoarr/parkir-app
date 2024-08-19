<form method="POST" action="{{ route('logout') }}">
    @csrf
    <div class="mb-12">
      <h3 class="text-gray-800 text-3xl font-extrabold">Logout</h3>

    <div class="mt-12">
      <button type="submit" class="w-full shadow-xl py-2.5 px-4 text-sm tracking-wide rounded-md text-white bg-[#45C47C] hover:bg-green-700 focus:outline-none">
        Logout
      </button>
    </div>
  </form>