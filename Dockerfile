# Use the official Ruby image with version 3.2
FROM ruby:3.2

# Expose port 3000 for the Rails server
EXPOSE 3000

# Set up the working directory
WORKDIR /workspace

# Install Node.js, Yarn, and system dependencies
RUN apt-get update -qq && \
    apt-get install -y nodejs && \
    apt-get install -y yarn build-essential gh npm libpq-dev tzdata libvips vim git gh && \
    rm -rf /var/lib/apt/lists/*

# Install Bundler
RUN gem install bundler

COPY Gemfile src/Gemfile.lock ./

# Install application gems
RUN bundle install

COPY src /workspace/src

WORKDIR /workspace/src

RUN RAILS_ENV=production SECRET_KEY_BASE=$(rails secret) rails assets:precompile

CMD ["rails", "server", "-b", "0.0.0.0"]
