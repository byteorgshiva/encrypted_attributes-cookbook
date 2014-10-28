# encoding: UTF-8
#
# Author:: Xabier de Zuazo (<xabier@onddo.com>)
# Copyright:: Copyright (c) 2014 Onddo Labs, SL. (www.onddo.com)
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'libraries'))

# Coverage
require 'simplecov'
if ENV['TRAVIS'] && RUBY_VERSION >= '2.0'
  require 'coveralls'
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
end
SimpleCov.start do
  add_group 'Libraries', '/libraries'
  add_group 'ChefSpec' do |src|
    %r(/spec/(recipes|resources|providers)).match(src.filename)
  end
  add_group 'RSpec' do |src|
    %r(/spec/(unit|functional|integration)).match(src.filename)
  end
end

require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  # Prohibit using the should syntax
  config.expect_with :rspec do |spec|
    spec.syntax = :expect
  end

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  # --seed 1234
  config.order = 'random'
  config.seed = 27187 if ENV['TRAVIS']

  # ChefSpec configuration
  config.log_level = :fatal
  config.color = true
  config.formatter = :documentation
end

at_exit { ChefSpec::Coverage.report! }
