require 'test/unit'
require 'mijireh'
require 'yaml'
require 'logger'

class MijirehOrderTest < Test::Unit::TestCase
  def setup
    RestClient.log = Logger.new(STDOUT)

    config = File.expand_path('../config.yml', __FILE__)
    Mijireh.access_key = YAML::load(File.open(config))['access_key']
  end

  def test_create
    order = Mijireh::Order.create(
      total: 8.00,
      return_url: 'http://blah.com',
      items: [{ name: 'Hipster Hat', price: 4.00, quantity: 2, sku: 'hipster-hat' }]
    )

    assert_not_nil order
    assert_not_nil order.order_number
  end
end
