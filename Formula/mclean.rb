class Mclean < Formula
  desc "macOS System Cleaner"
  homepage "https://github.com/ANGRYCONE/macOS-System-Cleaner"
  url "https://github.com/ANGRYCONE/macOS-System-Cleaner/releases/download/v2.4.6/macos_cleaner.sh"
  sha256 "9ac3804e939a87c7498d252f5b83268645592b5a18270936a05169d2c8ae83ee"
  version "2.4.6"

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
