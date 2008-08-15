# Set up some ENV for merb/rails compatibility, load the library

require File.dirname(__FILE__) + '/lib/active_record/base'
require File.dirname(__FILE__) + '/lib/shard_the_love'

if defined?(Rails)
  ShardTheLove::ROOT = RAILS_ROOT
  ShardTheLove::ENV = RAILS_ENV
  ShardTheLove::LOGGER = ActiveRecord::Base.logger
  ShardTheLove::DB_PATH = 'db/'
  ShardTheLove::RAKE_ENV_SETUP = :environment
elsif defined?(Merb)
  ShardTheLove::ROOT = Merb.root
  ShardTheLove::ENV = (Merb.env == 'rake' ? 'development' : Merb.env)
  ShardTheLove::LOGGER = Merb.logger
  ShardTheLove::DB_PATH = 'schema/'
  ShardTheLove::RAKE_ENV_SETUP = :merb_env
end

