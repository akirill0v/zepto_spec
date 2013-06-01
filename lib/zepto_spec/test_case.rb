module ZeptoSpec
  class TestCase

    def assert(expression)
      expression
    end

    class << self
      def inherited(child)
        @@test_cases ||= []
        @@test_cases << child
      end

      def run_all
        reporter = ZeptoSpec::Reporter.new
        @@test_cases.each do |test_case|
          test_case.run(reporter)
        end
        reporter.summary
      end

      def run(reporter)
        test_methods = instance_methods(false)
        test_methods.each do |m|
          res = run_test_method(m.to_s)
          reporter.collect(res)
        end
      end

      def run_test_method(test_name)
        result = {test_name: method_name}
        begin
          result = self.new.instance_eval(test_name)
          result[:status] = result ? :passed : :error
        rescue Exception => e
          result[:message] = e.message
          result[:status] = :fail
          result[:backtrace] = e.backtrace.inspect
        end
        result
      end
    end
  end
end
