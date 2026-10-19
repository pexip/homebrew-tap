class VsclientAT2 < Formula
  desc "Pexip Endpoint Provisioning Tool (beta)"
  homepage "https://pexip.com"
  version "2.0-BETA1"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://s3.eu-west-1.amazonaws.com/download.vmr.vc/public/software/vsclient/v2.0-BETA1/vsclient_darwin_arm64.zip"
      sha256 "f1943aa13424fd217aae9dfe98dc8eda2f9de7e965f89afac77653213187e47f"
    end
    on_intel do
      url "https://s3.eu-west-1.amazonaws.com/download.vmr.vc/public/software/vsclient/v2.0-BETA1/vsclient_darwin_amd64.zip"
      sha256 "c0c50da98812cecc6a6b92242c0d96356f97518a603d6204c920339315dc4e76"
    end
  end

  conflicts_with "vsclient", because: "both install a `vsclient` binary"

  def install
    binary = Hardware::CPU.arm? ? "vsclient_darwin_arm64" : "vsclient_darwin_amd64"
    chmod 0755, binary
    bin.install binary => "vsclient"
  end

  test do
    assert_match "vsclient #{version}", shell_output("#{bin}/vsclient version")
  end
end
