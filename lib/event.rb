class EventItem
  include Listable
  attr_reader :item_type, :description, :start_date, :end_date

  def initialize(item_type, description, options={})
    @item_type = item_type
    @description = description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
  end
    
  def details
    format_description(@description, @item_type) + "event dates: " + format_date(@start_date, @end_date)
  end
end
