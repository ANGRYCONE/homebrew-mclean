class Mclean < Formula
  desc "macOS System Cleaner"
  homepage "https://github.com/ANGRYCONE/macOS-System-Cleaner"
  url "https://github.com/ANGRYCONE/macOS-System-Cleaner/releases/download/v2.4.5/macos_cleaner.sh"
  sha256 "e02e30dcd993d9ceb516a8a52648fbe7e28634924b218fdb3142234eaa6234c6"
  version "2.4.5"

  depends_on :macos

  def install
    libexec.install "macos_cleaner.sh"

    (bin/"mclean").write <<~SH
      #!/bin/sh
      exec "#{libexec}/macos_cleaner.sh" --skip-update "$@"
    SH

    chmod 0755, libexec/"macos_cleaner.sh"
  end
end
