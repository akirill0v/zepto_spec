require 'zepto_helper'

class AssertsZepto < ZeptoHelper::TestCase

  zep "true asserts" do
    assert true
  end

  zep "false asserts" do
    assert false
  end

end
