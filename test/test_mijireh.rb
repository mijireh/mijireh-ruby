require 'test/unit'
require 'mijireh'

class MijirehTest < Test::Unit::TestCase

  def test_access_key
    Mijireh.access_key = 'blah'
    assert_equal 'blah', Mijireh.access_key
  end

end
