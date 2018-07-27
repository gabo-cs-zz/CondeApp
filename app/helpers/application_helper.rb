module ApplicationHelper
  def full_genders
    Employee.genders.inject({}) do |hash, item|
      hash.merge!("#{item.first}" => item.first)
    end
  end

  def page_entries_info(collection, options = {})
    entry_name = options[:entry_name] || (collection.empty?? 'entry' :
      collection.first.class.name.split('::').last.titleize)
      if collection.total_pages < 5
        case collection.size
          when 0; "No #{entry_name.pluralize} found."
          when 1; "Displaying #{collection.total_entries} #{entry_name}."
          else; "Displaying #{collection.total_entries} #{entry_name.pluralize}."
        end
      else
        %{Displaying %d - %d of %d #{entry_name.pluralize}} % [
        collection.offset + 1,
        collection.offset + collection.length,
        collection.total_entries
      ]
    end
  end
end
