# frozen_string_literal: true

require_relative 'lib/owm_client_25/version'

Gem::Specification.new do |spec|
  spec.name = 'owm_client_25'
  spec.version = OwmClient25::VERSION
  spec.authors = ['Abubjazov']
  spec.email = ['abubjazov@proton.me']

  spec.summary     = 'Ruby client for fetching current weather via OpenWeatherMap API v2.5'
  spec.description = <<~DESC
    This gem provides a convenient interface for OpenWeatherMap API v2.5 integration.#{' '}
    It allows fetching current weather data by geographic coordinates (latitude and longitude),#{' '}
    handles URL generation, and returns a structured response.
  DESC
  spec.homepage = 'https://github.com/Abubjazov/owm_client_25'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.4.1'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  # spec.metadata['changelog_uri'] = spec.homepage

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 2.14', '>= 2.14.3'
  spec.add_dependency 'zeitwerk', '~> 2.8', '>= 2.8.3'
end
