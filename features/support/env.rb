require 'aruba/cucumber'

PROJECT_ROOT = File.dirname(File.expand_path('../../', __FILE__))
ENV['PATH'] = File.join(PROJECT_ROOT, '/exe') + File::PATH_SEPARATOR + ENV['PATH']
