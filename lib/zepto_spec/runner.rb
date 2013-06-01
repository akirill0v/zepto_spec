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
        args = ARGV[0] || './test'
        require_zepto_files(args)
      end

      protected

      def require_zepto_files(path)
        path = File.expand_path(path)
        Dir[path].each do |f|
          if File.file? f
            require f
          else
            path = File.join(path, "*_zepto.rb")
            require_zepto_files(path)
          end
        end
      end
    end
  end
end
