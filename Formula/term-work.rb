class TermWork < Formula
  desc "Restore terminal tabs and Claude Code sessions on macOS"
  homepage "https://github.com/senwong/term-work"
  url "https://github.com/senwong/term-work/releases/download/v0.2.0/term-work-0.2.0-macos.tar.gz"
  sha256 "93e65c3451ff8710f8cc52a54426e961e91fe762ea7b0a3c0571c8f4885e2151"
  license "MIT"

  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install "work", "watcher.py", "terminals.py", "install.py", "VERSION", "README.md", "LICENSE"
    python = Formula["python@3.13"].opt_bin/"python3.13"
    { "term-work" => "work", "term-work-setup" => "install.py" }.each do |command, script|
      (bin/command).write <<~SH
        #!/bin/sh
        exec "#{python}" "#{libexec}/#{script}" "$@"
      SH
      (bin/command).chmod 0755
    end
  end

  def caveats
    <<~EOS
      Install a supported terminal (Kaku, WezTerm, iTerm2 or Ghostty) and Claude Code,
      then enable per-user session tracking:
        term-work-setup

      Run this again after brew upgrade to update the watcher copy.
      Both `term-work` and ~/.local/bin/work provide the CLI.
      Do not start a second watcher with brew services.

      Before uninstalling this formula, stop and remove the user service:
        term-work-setup --uninstall
      Session records are preserved in ~/.local/share/term-work.
    EOS
  end

  test do
    assert_equal "term-work 0.2.0", shell_output("#{bin}/term-work --version").strip
    assert_match "restore", shell_output("#{bin}/term-work --help")
    assert_match "--uninstall", shell_output("#{bin}/term-work-setup --help")
  end
end
