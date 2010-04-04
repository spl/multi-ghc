VERSION  := ${shell basename `pwd`}
PREFIX   := ${shell pwd}
SRCDIR   := ./src/ghc-${VERSION}

install: ${SRCDIR}
	cd ${SRCDIR} && ./configure --prefix=${PREFIX} && make install

clean: ${SRCDIR}
	rm -rf bin lib share

