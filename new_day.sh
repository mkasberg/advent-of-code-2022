#!/bin/sh

# Run this script without any args.
# It will:
#  - Create a new directory for the current day.
#  - Download your input.
#  - Set up some skeleton code to get started.
#
# Don't forget to set SESSION= in a .env file.

set -e

DIR=`dirname $0`
DAY=`TZ='America/New_York' date +%-d`
PADDED_DAY=`TZ='America/New_York' date +%d`
URL="https://adventofcode.com/2021/day/$DAY/input"

echo "📁 Creating dir $PADDED_DAY..."
mkdir -p "$DIR/$PADDED_DAY"

echo "📃 Fetching input..."
# Put SESSION=foobar in your .env file
. "$DIR/.env"
curl -sL -o "$DIR/$PADDED_DAY/input.txt" -H "Cookie: session=$SESSION" "$URL"

echo "💻 Preparing workspace..."

cp "$DIR/template.rb" "$DIR/$PADDED_DAY/solution.rb"
cp "$DIR/template.rb" "$DIR/$PADDED_DAY/solution2.rb"

echo "🚀 Welcome to Day $PADDED_DAY. Let's get coding!"
