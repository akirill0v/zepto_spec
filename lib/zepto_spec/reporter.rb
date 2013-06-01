module ZeptoSpec
  class Reporter
    attr_reader :formatter, :statistic

    def initialize(formatter)
      @formatter = formatter
      @statistic = {passed: [], error: [], fail: []}
    end

    def collect(test_result)
      @statistic[test_result[:status]] << test_result
      formatter.show_result(test_result)
    end

    def summary
      formatter.summary(@statistic)
    end

  end
end
