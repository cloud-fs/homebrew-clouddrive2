class Clouddrive2 < Formula
  desc "CloudDrive2"
  homepage "https://www.clouddrive2.com"
  version "0.8.12"
  license "Proprietary"

  #depends_on "macfuse"
  #shasum -a256 file_path
  if Hardware::CPU.arm?
    url "https://github.com/cloud-fs/cloud-fs.github.io/releases/download/v0.8.12/clouddrive-2-macos-aarch64-0.8.12.tgz"
    sha256 "5fe3ee0a3e74129dd321642b651c0928945700f5c9dc82aa9d896de4228c3b0d"
  else
    url "https://github.com/cloud-fs/cloud-fs.github.io/releases/download/v0.8.12/clouddrive-2-macos-x86_64-0.8.12.tgz"
    sha256 "b8137025aa2b7a3aaeb91fbf756aed3b28fa0f353c059e8ee4c2d0e53b18a76f"
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