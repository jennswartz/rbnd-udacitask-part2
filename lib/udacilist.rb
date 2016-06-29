class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end
   
  def add(item_type, description, options={})
    item_type = item_type.downcase
    case item_type
    when "todo"
      @items.push TodoItem.new(item_type, description, options) 
    when "event"
      @items.push EventItem.new(item_type, description, options)
    when "link"
      @items.push LinkItem.new(item_type, description, options)
    else
      raise UdaciListErrors::InvalidItemType, "#{item_type} is an invalid item type"
    end
  end
    
  def delete(index)
    if index <= @items.length 
      @items.delete_at(index - 1)
    else
	  raise UdaciListErrors::IndexExceedsListSize, "Deleted item exceeds list boundaries."
    end
  end

  def ask_delete
    ask_delete = HighLine.new
    want_to_delete = ask_delete.agree "Do you want to delete an item? Answer 'yes' or 'no'."
    if want_to_delete
      which_items = ask_delete.ask "Which item would you like to delete (enter number)?"
      puts "Ok, you want to delete Item #{which_items}.  I will delete it."
      delete(which_items.to_i)
    else
      puts "Goodbye."
    end
  end
        
  def all(list=@items)
    puts "-" * 20
    puts @title
    puts "-" * 20
    list.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end

  def filter(item_type)
    item_type = item_type.downcase
    case item_type
    when "todo"
      filter_list = @items.select { |item| item.class == TodoItem }
      all(filter_list)
    when "event"
      filter_list = @items.select { |item| item.class == EventItem }
      all(filter_list)
    when "link"
      filter_list = @items.select { |item| item.class == LinkItem }
      all(filter_list)
    else 
      raise UdaciListErrors::InvalidListFilterType, "There aren't any items of that type."
    end
  end

  def ask_filter
    ask_filter = HighLine.new
    want_to_filter = ask_filter.agree "Do you want organize by list type? Answer 'y' or 'n'."
    if want_to_filter
      how_filter = ask_filter.ask "What type of list do you want? e.g. todo, event, link"
      filter(how_filter)
    else
      puts "Goodbye."
    end
  end
end