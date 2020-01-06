require 'logger'

module Pivot
  class Logger < ::Logger
    def initialize(output)
      super(output)
    end
  end
end