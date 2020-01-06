module Pivot
  class Item
    VALID_PREFIXES = %w(EREC AZR).freeze
    private_constant :VALID_PREFIXES

    attr_reader :name, :points
    attr_accessor :assignee

    def initialize(name:, points:, assignee: nil)
      @name = name
      @assignee = assignee
      @points = points
    end

    def +(item)
      points + item.points
    end

    def project_code
      name.split("-").first
    end

    def valid?
      VALID_PREFIXES.include? project_code
    end
  end
end
