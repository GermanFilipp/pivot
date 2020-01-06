module Pivot
  class Tracker
    class << self
      def count(items)
        items.length
      end

      def item_for(items, assignee)
        sorted = sort_by_name(items)
        select_by_assignee(sorted, assignee).first
      end

      def pivoted?(items, assignee)
        !select_by_assignee(items, assignee).empty?
      end

      def total_points(items, assignee: nil)
        selected_assignees = assignee ? select_by_assignee(items, assignee) : uniq_by_assignee(sort_by_name(items))
        selected_assignees.sum { |item| item[:points] }
      end

      def unique_assignees(items)
        uniq_by_assignee(items)
      end

      private

      def sort_by_name(items)
        items.sort_by { |item| item[:name] }
      end

      def select_by_assignee(items, assignee)
        items.select { |item| item[:assignee] == assignee }
      end

      def uniq_by_assignee(items)
        items.uniq { |item| item[:assignee] }
      end
    end
  end
end
