#!/bin/bash

declare extra_configure_flags='--with-cpu=cortex-a9 --with-fpu=neon --with-float=softfp --with-mode=thumb'

declare triplet='arm-kindlepw2-linux-gnueabi'

declare sysroot='https://web.archive.org/web/0if_/https://github.com/koreader/koxtoolchain/releases/latest/download/kindlepw2.zip'
