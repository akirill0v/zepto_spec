require 'zepto_helper'

class AssertsZepto < ZeptoSpec::TestCase

  def test_assert_true
    assert true
  end

  def test_exception
    2/0
  end

  def test_assert_false
    assert false
  end

end
