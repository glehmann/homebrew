class Clfft < Formula
  homepage "https://github.com/clMathLibraries/clFFT/"
  url "https://github.com/clMathLibraries/clFFT/archive/v2.4.tar.gz"
  sha1 "99518fea7aef0b3c2bab4055666122f633181632"

  depends_on "cmake" => :build

  patch do
    # rename Client
    url "https://github.com/clMathLibraries/clFFT/pull/53.diff"
    sha1 "8f9f66419c3add6beb1def058884dc12822313f2"
  end

  patch do
    # don't install py files in bin
    url "https://github.com/clMathLibraries/clFFT/commit/ae845846990bfabe5c01ee8629b8df32ca9ce7a9.diff"
    sha1 "6a28e3347eb5e849fd63eccd0d1750455af437cd"
  end

  patch do
    # properly deal with rpaths
    url "https://github.com/clMathLibraries/clFFT/pull/59.diff"
    sha1 "2f0929f0aff6ea87d799d0e7183c3bff58dd9098"
  end

  patch do
    # don't use lib64 in lib path
    url "https://github.com/clMathLibraries/clFFT/pull/61.diff"
    sha1 "b4cec7072c592a68c5c603d6f2e628baaedca35e"
  end

  def install
    cd "src"
    system "cmake", ".", "-DBUILD_TEST:BOOL=OFF", "-DCMAKE_BUILD_TYPE:STRING=", *std_cmake_args
    system "make", "install"
  end

  test do
    system bin/"clFFT-client", "-i"
  end
end
