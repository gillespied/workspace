#!/bin/bash

# Check if Jekyll and Bundler gems are installed
if ! gem list jekyll -i; then
  echo "Installing Jekyll gem..."
  gem install jekyll
fi

if ! gem list bundler -i; then
  echo "Installing Bundler gem..."
  gem install bundler
fi

# Install gems from Gemfile
bundle install

# Create a new Jekyll site if necessary
if [ ! -f Gemfile ]; then
  echo "No Gemfile found. Creating new Jekyll site..."
  bundle exec jekyll new . --force
fi

# Install gems required by the new Jekyll site
bundle install

