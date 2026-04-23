class Magicadventure < Formula
  desc "A terminal RPG with slot-based saves, turn-based combat, and optional multiplayer"
  homepage "https://github.com/MaizerGomes/magicadvanture"
  version "6.0"
  url "https://github.com/MaizerGomes/magicadvanture/releases/download/v6.0/magicadventure-mac-arm"
  sha256 "054ca7f5f6bf9c530c077f27a5a98bc96221c31bb76dec3340fcfc4f13be7a94"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/MaizerGomes/magicadvanture/releases/download/v6.0/magicadventure-mac-64"
      sha256 "1504cd888a017fc9ecf35fe0956b078004e68f5b9b3fc7dcee03beba16724e75"
    end
  end

  def install
    bin.install "magicadventure"
  end

  test do
    assert shell_output("#{bin}/magicadventure").include?("Magic Adventure")
  end
end