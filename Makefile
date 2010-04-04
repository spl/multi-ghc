# /opt/ghc/Makefile: convenient for building binary GHC distributions
# AUTHOR: Sean Leather
# LICENSE: public domain

################################################################################
# To use this Makefile, I do the following:
#
#   1. Create a directory for version $V of the GHC distribution.
#
#        $ pwd
#        /opt/ghc
#        $ mkdir -p $V/src
#
#   2. Create a symbolic link to this Makefile
#
#        $ cd $V
#	 $ ln -s ../Makefile
#
#   3. Download and unpack the desired GHC distribution
#
#	 $ cd src
#	 $ wget http://www.haskell.org/ghc/dist/$V/ghc-$V-i386-unknown-linux-n.tar.bz2
#	 $ tar jxf ghc-$V-i386-unknown-linux-n.tar.bz2
#
#   4. Install (or clean)
#
#	 $ cd ..
#	 $ make install
#

VERSION  := ${shell basename `pwd`}
PREFIX   := ${shell pwd}
SRCDIR   := ./src/ghc-${VERSION}

install: ${SRCDIR}
	cd ${SRCDIR} && ./configure --prefix=${PREFIX} && make install

clean: ${SRCDIR}
	rm -rf bin lib share

