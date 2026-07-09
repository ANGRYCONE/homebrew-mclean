class Mclean < Formula
  desc "macOS System Cleaner"
  homepage "https://github.com/ANGRYCONE/macOS-System-Cleaner"
  url "https://github.com/ANGRYCONE/macOS-System-Cleaner/releases/download/v2.5/macos_cleaner.sh"
  sha256 "1ddfffca229809ec93b99459ab5d4a31eb80c6b301ef3791452fc0ae1d3040c7"
  version "2.5"

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
