class MacManager < Formula
  include Language::Python::Virtualenv

  desc "Monitor your Mac's health, security and hardware from the terminal"
  homepage "https://github.com/armelingu/mac-manager"
  url "https://files.pythonhosted.org/packages/73/c4/0a1b3a6ad294f5c41850e1cf68d06fa62f577b8f9200e07260dd55a17639/mac_manager-0.1.1.tar.gz"
  sha256 "975da708c2a6a510c85030bb1db0f1d4815129f34f00c93fa77edf15ddf0fd74"
  license "Apache-2.0"
  head "https://github.com/armelingu/mac-manager.git", branch: "main"

  depends_on "python@3.12"

  # Runtime Python dependencies pulled from PyPI.
  # When Dependabot bumps `pyproject.toml`, run `brew bump-formula-pr`
  # (or regenerate the block with `pip download --no-binary :all:`)
  # and update both `url` and `sha256` below.

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/aa/c6/d1ddf4abb55e93cebc4f2ed8b5d6dbad109ecb8d63748dd2b20ab5e57ebe/psutil-7.2.2.tar.gz"
    sha256 "0746f5f8d406af344fd547f1c8daa5f5c33dbc293bb8d6a16d80b4bb88f59372"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0/markdown-it-py-3.0.0.tar.gz"
    sha256 "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/c3/b2/bc9c9196916376152d655522fdcebac55e66de6603a76a02bca1b6414f6c/pygments-2.20.0.tar.gz"
    sha256 "6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f"
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
