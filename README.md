# Advent of Code 2022

These are my own solutions for [Advent of Code 2022](https://adventofcode.com/).
Note that I'm usually optimizing for coding speed over code clarity, so these
might not always be the cleanest or most optimal solution.

**Spoiler alert!** This repository contains solutions to the problems.

## New Days

    $ ./new_day.sh

This script will create a new directory for the current day, download the input,
and put skeleton code in place. To use it, create a `.env` file with your
session `SESSION=foo`.

## Running Solutions

Most scripts are ruby scripts. I'd expect them to work with any recent version
of ruby, and there aren't any dependencies to install.

Pass the input to the script like `./solution.rb input.txt` or `cat input.txt |
./solution.rb`.
