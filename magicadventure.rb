class Magicadventure < Formula
  desc "A terminal RPG with slot-based saves, turn-based combat, and optional multiplayer"
  homepage "https://github.com/MaizerGomes/magicadvanture"
  version "7.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MaizerGomes/magicadvanture/releases/download/v7.3/magicadventure-mac-arm"
      sha256 "3cc646a24f982b3453a9931df8a6be09e93e807fa27a6897c7414a9dde8ee29a"
    else
      url "https://github.com/MaizerGomes/magicadvanture/releases/download/v7.3/magicadventure-mac-64"
      sha256 "2e06c15bb6c133894e548ed7b74353ef9b64e2cbb6c3d0b650dc820dfc749928"
    end
  end

  def install
    # Find any file in staging that is executable
    # The actual filename from GitHub is mac-arm or mac-64
    found = nil
    Dir.chdir(staging) do
      found = Dir["*"].find { |f| File.executable?(f) && !File.directory?(f) }
    end
    
    if found
      # Install with explicit new name
      bin.install found => "magicadventure"
    else
      raise "No executable found in staging"
    end
  end
end