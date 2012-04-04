require 'test/unit'
require 'mijireh'
require 'yaml'
require 'logger'

class MijirehStoreTest < Test::Unit::TestCase
  def setup
    RestClient.log = Logger.new(STDOUT)

    config = File.expand_path('../config.yml', __FILE__)
    Mijireh.access_key = YAML::load(File.open(config))['access_key']
  end

  def test_retrieve
    store = Mijireh::Store.retrieve
    assert_not_nil store
    assert_not_nil store.name
  end
end
