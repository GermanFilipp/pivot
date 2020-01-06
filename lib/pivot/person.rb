module Pivot
  class Person
    attr_reader :email, :first_name, :last_name, :items

    def initialize(email:, first_name:, last_name:)
      @email = email
      @first_name = first_name
      @last_name = last_name
      @items = []
    end

    def add_item(item)
      @items << item
      item.assignee = email
      yield if block_given?
    end
  end
end
