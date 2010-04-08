Managing Multiple GHC Distributions
===================================

The **multi-ghc** repository contains tools for managing multiple distributions
of GHC in a single system. It simplifies the installation process and switching
the current environment to use one GHC+Cabal.

What's Inside
-------------

* `ghc-config` - A Bash script that sets up the environment and switches between
  GHC+Cabal paths. This works primarily using directory conventions and symbolic
  links.

* `Makefile` - For symplifying the building of Linux binary tarballs.

How to Use
----------

1.  Create a directory for your GHC distributions. We'll call this directory
    `$GHC_DISTRIBUTION_DIR` for now.

2.  Clone this repository into `$GHC_DISTRIBUTION_DIR`.

3.  Add the following to your startup scripts (i.e. your `.bashrc` or
    `.bash_profile`):

        # These environment variables are only necessary if you don't use the defaults
        # shown.
        GHC_DISTRIBUTION_DIR="/opt/ghc"
        GHC_CONFIG_DIR="$HOME/.ghc-config"
        CABAL_USER_DIR="$HOME/.cabal"

        # Add the paths for ghc-config, ghc, and cabal-installed binaries. Use
        # the actual paths if you don't set the variables above.
        PATH=$PATH:$GHC_DISTRIBUTION_DIR/bin  # ghc-config
        PATH=$PATH:$GHC_CONFIG_DIR/ghc/bin    # ghc
        PATH=$PATH:$CABAL_USER_DIR/bin        # cabal and cabal-installed binaries

        # Initialize the current configuration for this session.
        ghc-config -i

4.  Install a GHC distribution into sudirectories of
    `$GHC_DISTRIBUTION_DIR/$GHC_VERSION/src`, where `$GHC_VERSION` is that
    particular GHC version number. For example:

        $ ls /opt/ghc/6.10.4/src
        ghc-6.10.4/  ghc-6.10.4-i386-unknown-linux-n.tar.bz2

5.  Create a symbolic link to the included `Makefile` in `$GHC_DISTRIBUTION_DIR`.

        $ cd /opt/ghc/6.10.4
        $ ln -s ../Makefile

6.  Install the `$GHC_VERSION` of GHC using the `Makefile`. This will use the
    directory and naming conventions established by the previous steps. See the
    `Makefile for details.

        $ make install

7.  Restart your shell.

8.  Run `ghc-config` to see the help information.

9.  Run `ghc --version` to confirm that GHC works.

10.  Install `cabal` by downloading the [latest
     tarball](http://hackage.haskell.org/package/cabal-install) and running the
     `bootstrap.sh` script.

11.  Run `cabal --version` to confirm that cabal-install works.

Questions or Contributions
--------------------------

I welcome feedback (constructive criticism, suggestions, etc.). Send me a
message on GitHub, or [email me](mailto:leather@cs.uu.nl).

Sean Leather

