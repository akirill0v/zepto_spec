require "zepto_spec/version"

module ZeptoSpec
  autoload :TestCase, 'zepto_spec/test_case'
end
at_exit do
  ZeptoSpec::TestCase.run_all
end
