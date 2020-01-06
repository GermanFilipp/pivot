module Pivot
  class Item
    VALID_PREFIXES = %W(EREC AZR).freeze
    private_constant :VALID_PREFIXES
    def initialize(name:, assignee:, points:)
      @name = name
      @assignee = assignee
      @points = points
    end

    attr_reader :name, :assignee, :points
    
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
