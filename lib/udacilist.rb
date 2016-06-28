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
      raise UdaciListErrors::InvalidItemType, "#{type} is an invalid item type"
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
  
  def delete(index)
    if index <= @items.length 
      @items.delete_at(index - 1)
    else
	  raise UdaciListErrors::IndexExceedsListSize, "Deleted item exceeds list boundaries."
    end
  end

  def all
    puts "-" * 20
    puts @title
    puts "-" * 20
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
    
end
