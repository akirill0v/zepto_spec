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

      def test_cases
        @@test_cases
      end

      def run(reporter)
        test_methods = instance_methods(false)
        test_methods.each do |m|
          res = run_test_method(m.to_s)
          reporter.collect(res)
        end
      end

      def run_test_method(test_name)
        metadata = {test_name: test_name}
        begin
          result = self.new.instance_eval(test_name)
          metadata[:status] = result ? :passed : :error
        rescue Exception => e
          metadata[:message] = e.message
          metadata[:status] = :fail
          metadata[:backtrace] = e.backtrace.inspect
        end
        metadata
      end
    end
  end
end
