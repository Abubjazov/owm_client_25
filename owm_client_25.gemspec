# frozen_string_literal: true

require_relative 'lib/owm_client_25/version'

Gem::Specification.new do |spec|
  spec.name = 'owm_client_25'
  spec.version = OwmClient25::VERSION
  spec.authors = ['Abubjazov']
  spec.email = ['abubjazov@proton.me']

  spec.summary     = 'Ruby-клиент для получения текущей погоды через OpenWeatherMap API v2.5.'
  spec.description = <<~DESC
    Этот гем предоставляет удобный интерфейс для интеграции с OpenWeatherMap API версии 2.5.
    Он позволяет запрашивать актуальные данные о погоде по географическим координатам
    (широте и долготе), берет на себя формирование URL-запросов и возвращает
    структурированный ответ.
  DESC
  spec.homepage = 'https://github.com/Abubjazov/owm_client_25'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.4.1'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  # spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
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

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
