class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end
  
  def add(type, description, options={})
    type = type.downcase
    case type
    when "todo"
      @items.push TodoItem.new(description, options) 
    when "event"
      @items.push EventItem.new(description, options)
    when "link"
      @items.push LinkItem.new(description, options)
    else
      raise UdaciListErrors::InvalidItemType, "#{type} is an invalid item type"
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
