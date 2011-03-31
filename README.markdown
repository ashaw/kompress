# Kompress

A simple CSS and HTML compressor. It removes `\s+`. Highly unstable/experimental at this point.

## Install

`gem install kompress`

## Usage

    k = Kompress::CSS.new(big_css)
    k.css #=> compressed css
    
    k = Kompress::HTML.new(big_html)
    k.html #=> compressed html
    
    
# Copyright

Copyright (c) 2011 Al Shaw. See LICENSE.txt for
further details.

