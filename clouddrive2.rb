class Clouddrive2 < Formula
  desc "CloudDrive2"
  homepage "https://www.clouddrive2.com"
  version "0.9.24"
  license "Proprietary"

  #depends_on "macfuse"
  #shasum -a 256 file_path
  if Hardware::CPU.arm?
    url "https://github.com/cloud-fs/cloud-fs.github.io/releases/download/v0.9.24/clouddrive-2-macos-aarch64-0.9.24.tgz"
    sha256 "215fe5492b0df3cba223f028c9266e6fd6fa5dd8feaf4371d6e32b13ec32bce5"
  else
    url "https://github.com/cloud-fs/cloud-fs.github.io/releases/download/v0.9.24/clouddrive-2-macos-x86_64-0.9.24.tgz"
    sha256 "357b1ce6f1463563877f563bcd8475f5372a8b47eb6773c3c823db47b5169367"
  end

  def install
    # Install binary and wwwroot into libexec
    libexec.install "clouddrive", "wwwroot"

    # Create a launch script for background execution in bin
    (bin/"clouddrive-daemon").write <<~EOS
      #!/bin/bash
      cd #{libexec}
      "./clouddrive"
    EOS
    chmod 0555, bin/"clouddrive-daemon"
  end

  service do
    run [opt_bin/"clouddrive-daemon"]
    run_type :immediate
    keep_alive true
    working_dir libexec
    process_type :background
    launch_only_once true
  end
  
  def caveats
    <<~EOS
      CloudDrive2 requires macFUSE for full functionality.
  
      You can install macFUSE via Homebrew Cask:
          brew install --cask macfuse
      
      Or download and install it directly from the official website:
          https://macfuse.github.io/
  
      Once macFUSE is installed, you can start the CloudDrive2 service:
          brew services start clouddrive2
  
      Then access the web interface at:
          http://localhost:19798
  
      To stop the service:
          brew services stop clouddrive2
  
      To uninstall CloudDrive2 entirely:
          brew services stop clouddrive2
          brew uninstall clouddrive2
    EOS
  end
end