class Magicadventure < Formula
  desc "A terminal RPG with slot-based saves, turn-based combat, and optional multiplayer"
  homepage "https://github.com/MaizerGomes/magicadvanture"
  version "7.1"
  url "https://github.com/MaizerGomes/magicadvanture/releases/download/v7.1/magicadventure-mac-arm"
  sha256 "b74f623affebc913a72b63a9e7859be57d04e99399e112c1c9bd8cbd55094e3e"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/MaizerGomes/magicadvanture/releases/download/v7.1/magicadventure-mac-64"
      sha256 "2cae16a21cf9b46a47bdd78d7672c42549f8a28b3e87e1613accf278e884525a"
    end
  end

  def install
    bin.install "magicadventure-mac-arm" => "magicadventure"
  end

  test do
    assert shell_output("#{bin}/magicadventure").include?("Magic Adventure")
  end
end