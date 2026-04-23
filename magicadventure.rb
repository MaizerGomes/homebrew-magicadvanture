class Magicadventure < Formula
  desc "A terminal RPG with slot-based saves, turn-based combat, and optional multiplayer"
  homepage "https://github.com/MaizerGomes/magicadvanture"
  version "6.0"
  url "https://github.com/MaizerGomes/magicadvanture/releases/download/v6.0/magicadventure-mac-arm"
  sha256 "677553c7cb54796d27d56fe21a23ef0ce767e44c6e6501eff45b5f21ce10c062"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/MaizerGomes/magicadvanture/releases/download/v6.0/magicadventure-mac-64"
      sha256 "48bf41d17c85828575255eb23ce5bb76fa8a6d83b76eff61422cb153b1cdb25c"
    end
  end

  def install
    bin.install "magicadventure"
  end

  test do
    assert shell_output("#{bin}/magicadventure").include?("Magic Adventure")
  end
end