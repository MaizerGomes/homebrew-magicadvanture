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
    # Just install whatever executable is in the stage
    begin
      # First try the staged download
      staged = Dir["stage/*"].find { |f| File.executable?(f) && !File.directory?(f) }
      if staged
        bin.install staged
        return
      end
    rescue
      # stage not defined
    end
    
    # Fallback: copy from prefix
    Dir["#{prefix}/*"].each do |path|
      next unless File.executable?(path) && !File.directory?(path)
      cp path, bin/"magicadventure"
      return
    end
    
    raise "No installable file found"
  end

  test do
    assert shell_output("#{bin}/magicadventure").include?("Magic Adventure")
  end
end
