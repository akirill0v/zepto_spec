require "zepto_spec/version"

module ZeptoSpec
  autoload :TestCase, 'zepto_spec/test_case'
  autoload :Formatter, 'zepto_spec/formatter'
  autoload :Reporter, 'zepto_spec/reporter'
end
at_exit do
  ZeptoSpec::TestCase.run_all
end
