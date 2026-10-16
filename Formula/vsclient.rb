class Vsclient < Formula
  desc "Pexip Endpoint Provisioning Tool"
  homepage "https://pexip.com"
  version "1.3"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://s3.eu-west-1.amazonaws.com/download.vmr.vc/public/software/vsclient/v1.3/vsclient_darwin_arm64.zip"
      sha256 "005300fef4d3e319cdebbc02e00ca26d725f9bab8f88145fe58f1e2f5db43cef"
    end
    on_intel do
      url "https://s3.eu-west-1.amazonaws.com/download.vmr.vc/public/software/vsclient/v1.3/vsclient_darwin_amd64.zip"
      sha256 "ba7991978cb5092491512af8334a1f94bcef0ebfbba16e73993172640dd178fe"
    end
  end

  def install
    chmod 0755, "vsclient"
    bin.install "vsclient"
  end

  test do
    assert_match "vsclient #{version}", shell_output("#{bin}/vsclient --help")
  end
end
