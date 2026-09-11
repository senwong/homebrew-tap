class KakuWork < Formula
  desc "Restore Kaku tabs and Claude Code sessions on macOS"
  homepage "https://github.com/senwong/kaku-work"
  url "https://github.com/senwong/kaku-work/releases/download/v0.1.0/kaku-work-0.1.0-macos.tar.gz"
  sha256 "7888ebd5501b0235c2b3a67f2f683738d2f49dce494d8a940cb60b7c4cabfe83"
  license "MIT"

  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install "work", "watcher.py", "install.py", "VERSION", "README.md", "LICENSE"
    python = Formula["python@3.13"].opt_bin/"python3.13"
    { "kaku-work" => "work", "kaku-work-setup" => "install.py" }.each do |command, script|
      (bin/command).write <<~SH
        #!/bin/sh
        exec "#{python}" "#{libexec}/#{script}" "$@"
      SH
      (bin/command).chmod 0755
    end
  end

  def caveats
    <<~EOS
      Install Kaku and Claude Code, then enable per-user session tracking:
        kaku-work-setup

      Run this again after brew upgrade to update the watcher copy.
      Both `kaku-work` and ~/.local/bin/work provide the CLI.
      Do not start a second watcher with brew services.

      Before uninstalling this formula, stop and remove the user service:
        kaku-work-setup --uninstall
      Session records are preserved in ~/.local/share/kaku-work.
    EOS
  end

  test do
    assert_equal "kaku-work 0.1.0", shell_output("#{bin}/kaku-work --version").strip
    assert_match "restore", shell_output("#{bin}/kaku-work --help")
    assert_match "--uninstall", shell_output("#{bin}/kaku-work-setup --help")
  end
end
