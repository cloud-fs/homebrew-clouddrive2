class Clouddrive2 < Formula
    desc "CloudDrive2"
    homepage "https://www.clouddrive2.com"
    version "0.8.7"
    license "Proprietary"
  
    depends_on "macfuse"

    
    if Hardware::CPU.arm?
        url "https://github.com/cloud-fs/cloud-fs.github.io/releases/download/v0.8.7/clouddrive-2-macos-x86_64-0.8.7.tgz"
        sha256 "28ca1b0cb6d9dfcb407ada8fd83ac77bda02973cd8a6e4c4c8c577a0e80f5472"
    else
        url "https://github.com/cloud-fs/cloud-fs.github.io/releases/download/v0.8.7/clouddrive-2-macos-aarch64-0.8.7.tgz"
        sha256 "c92abc697a42310b54f632458bb90968f0910eda995f2051bfd671de6dd89a6b"
    end
  
    def install
        bin.install "clouddrive"
    end
  
    def caveats
      <<~EOS
        Usage: clouddrive [options].
      EOS
    end
  
    test do
      system "#{bin}/clouddrive", "--version"
    end
  end