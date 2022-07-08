#!/bin/sh

# Hao Wang <haowang@ece.utoronto.ca>
# http://www.haow.ca/

## Information
## http://carlo-hamalainen.net/blog/2007/12/11/installing-minion-pro-fonts/
## http://www.ctan.org/tex-archive/fonts/mnsymbol/

## 0: Install
##   http://www.lcdf.org/type/
## I used --without-kpathsea to configure (with MacTeX 2011):
##
## ./configure --without-kpathsea
## make
## sudo make install

## Destination.  I like it here, but
#  DEST=`kpsexpand '$TEXMFLOCAL'`
## might be better for a computer-wide install.
DEST=/usr/local/texlive/texmf-local

## Downloader:
DOWNLOAD="curl -OL"

## Directory where minion fonts can be found:
MINIONSRC=./otf-fonts/

## 1: MnSymbol
## http://www.ctan.org/tex-archive/fonts/mnsymbol/
$DOWNLOAD http://mirror.ctan.org/fonts/mnsymbol.zip

unzip mnsymbol.zip
cd mnsymbol/tex

## Generates MnSymbol.sty
latex MnSymbol.ins

sudo mkdir -p $DEST/tex/latex/MnSymbol/      \
              $DEST/fonts/source/public/MnSymbol/ \
              $DEST/doc/latex/MnSymbol/

sudo cp MnSymbol.sty $DEST/tex/latex/MnSymbol/MnSymbol.sty
cd .. # we were in mnsymbol/tex
sudo cp source/* $DEST/fonts/source/public/MnSymbol/
sudo cp MnSymbol.pdf README $DEST/doc/latex/MnSymbol/

sudo mkdir -p $DEST/fonts/map/dvips/MnSymbol \
              $DEST/fonts/enc/dvips/MnSymbol      \
              $DEST/fonts/type1/public/MnSymbol   \
              $DEST/fonts/tfm/public/MnSymbol
sudo cp enc/MnSymbol.map $DEST/fonts/map/dvips/MnSymbol/
sudo cp enc/*.enc $DEST/fonts/enc/dvips/MnSymbol/
sudo cp pfb/*.pfb $DEST/fonts/type1/public/MnSymbol/
sudo cp tfm/* $DEST/fonts/tfm/public/MnSymbol/

## I believe that this is not strictly needed if DEST is in the home
## tree on OSX, but might be needed otherwise
sudo mktexlsr
sudo updmap-sys --enable MixedMap MnSymbol.map

cd ..

# $DOWNLOAD http://carlo-hamalainen.net/blog/myfiles/minionpro/mnsymbol-test.tex
# pdflatex mnsymbol-test.tex

## Identify the version of your fonts
## otfinfo -v /path-to-otf/otf/MinionPro-Regular.otf
## Version 2.015;PS 002.000;Core 1.0.38;makeotf.lib1.7.9032
## Choose enc-2.000.zip

##  2: MinionPro
$DOWNLOAD http://mirrors.ctan.org/fonts/minionpro/enc-2.000.zip
$DOWNLOAD http://mirrors.ctan.org/fonts/minionpro/metrics-base.zip
$DOWNLOAD http://mirrors.ctan.org/fonts/minionpro/metrics-full.zip
$DOWNLOAD http://mirrors.ctan.org/fonts/minionpro/scripts.zip

## This will make the otf directory, among other things.
unzip scripts.zip

cp $MINIONSRC/Minion*otf otf/

## Generate the pfb files
## This step requires that the LCDF type tools are installed.  Get them here:
##   http://www.lcdf.org/type/
./convert.sh

## Copy the pfb files to where they belong:
mkdir -p $DEST/fonts/type1/adobe/MinionPro
sudo cp pfb/*.pfb $DEST/fonts/type1/adobe/MinionPro

SRC=`pwd`
cd $DEST
sudo unzip $SRC/enc-2.000.zip
sudo unzip $SRC/metrics-base.zip
sudo unzip $SRC/metrics-full.zip
cd $SRC

sudo mktexlsr
sudo updmap-sys --enable MixedMap MinionPro.map
sudo updmap-sys

## Test:
# $DOWNLOAD http://carlo-hamalainen.net/blog/myfiles/minionpro/minionpro-test.tex
# pdflatex minionpro-test.tex