require 'zepto_helper'
class ExceptionsZepto < ZeptoSpec::TestCase

  def test_exception
    2/0
  end
end
