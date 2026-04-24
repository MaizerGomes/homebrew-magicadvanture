class Magicadventure < Formula
  desc "A terminal RPG with slot-based saves, turn-based combat, and optional multiplayer"
  homepage "https://github.com/MaizerGomes/magicadvanture"
  version "6.0"
  url "https://github.com/MaizerGomes/magicadvanture/releases/download/v6.0/magicadventure-mac-arm"
  sha256 "c1a9c59ad18d263ece16637a2c86c7100baf918e627bc496b1b54903f841e98e"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/MaizerGomes/magicadvanture/releases/download/v6.0/magicadventure-mac-64"
      sha256 "8794f09783a3051c6edaafe4cf29dd311a75944fb3ce693174ba3d0e4e1b9794"
    end
  end

  def install
    bin.install "magicadventure-mac-arm" => "magicadventure"
    chmod +x, bin/"magicadventure"
  end

  test do
    assert shell_output("#{bin}/magicadventure").include?("Magic Adventure")
  end
end