# rr-matchy

## Summary

A matcher for use with Jeremy McAnally's `matchy` that integrates with RR.

## Installation

    gem install rr-matchy
  
## Usage

Somewhere in your `test_helper.rb`:

    require 'rr-matchy'
    
    class Test::Unit::TestCase
      include RR::Adapters::TestUnit
      extend RRMatchy
    end

Now you can say:

    this.should have_received(:that)
    
and

    this.should_not have_received(:that)

## TODO

Probably should submit a pull request to btakita eventually, but we'll see how this works first.

## Author/License

Copyright (c) 2010 Elliot Winkler. See LICENSE for details.
