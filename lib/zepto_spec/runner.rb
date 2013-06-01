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

      def cli
        $LOAD_PATH.unshift(File.join(Dir.getwd, 'test'))
        args = ARGV[0]
        path = File.expand_path(args)
        require path
      end
    end
  end
end
