class MacManager < Formula
  include Language::Python::Virtualenv

  desc "Monitor your Mac's health, security and hardware from the terminal"
  homepage "https://github.com/armelingu/mac-manager"
  license "Apache-2.0"
  head "https://github.com/armelingu/mac-manager.git", branch: "main"

  # TODO: populate on first release.
  #
  # Once v0.1.0 is cut, uncomment and fill in:
  #
  #   url    "https://github.com/armelingu/mac-manager/archive/refs/tags/v0.1.0.tar.gz"
  #   sha256 "<sha256 of the tarball above>"
  #
  # Or, after PyPI publication (preferred — smaller download, no sdist extras):
  #
  #   url    "https://files.pythonhosted.org/packages/source/m/mac-manager/mac_manager-0.1.0.tar.gz"
  #   sha256 "<sha256 of the PyPI sdist above>"

  depends_on "python@3.12"

  # Runtime Python dependencies — keep `url`/`sha256` in sync with
  # `pyproject.toml` when Dependabot bumps them.
  resource "rich" do
    url "https://files.pythonhosted.org/packages/source/r/rich/rich-13.7.0.tar.gz"
    sha256 "PLACEHOLDER_RICH_SHA256"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/source/p/psutil/psutil-5.9.0.tar.gz"
    sha256 "PLACEHOLDER_PSUTIL_SHA256"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/source/m/markdown-it-py/markdown-it-py-3.0.0.tar.gz"
    sha256 "PLACEHOLDER_MDIT_SHA256"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/source/m/mdurl/mdurl-0.1.2.tar.gz"
    sha256 "PLACEHOLDER_MDURL_SHA256"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/source/P/Pygments/pygments-2.17.2.tar.gz"
    sha256 "PLACEHOLDER_PYGMENTS_SHA256"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # `mm --version` should return the same version Homebrew installed.
    assert_match version.to_s, shell_output("#{bin}/mm --version")

    # Help should enumerate the expected subcommands. `mm` shells out to
    # macOS binaries when invoked without args, so we stick to `--help`
    # in the test sandbox.
    help = shell_output("#{bin}/mm --help")
    %w[battery health disk clean net doctor watch alerts status security dev].each do |cmd|
      assert_match cmd, help
    end
  end
end
