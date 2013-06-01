module ZeptoSpec
  class Runner
    class << self
      def autorun
        formatter = ZeptoSpec::Formatter.new
        reporter = ZeptoSpec::Reporter.new(formatter)

        ZeptoSpec::TestCase.test_cases.each do |test_case|
          test_case.run(reporter)
        end
        reporter.summary
      end
    end
  end
end
