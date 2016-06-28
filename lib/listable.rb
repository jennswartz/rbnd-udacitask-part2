module Listable
  def format_description(description, item_type)
    "#{description} (#{item_type})".ljust(25)
  end

  def format_date(start_date, end_date=nil)
    dates = start_date.strftime("%D") if start_date
    dates << " -- " + end_date.strftime("%D") if end_date
    dates = "N/A" if !dates
    return dates
  end

  def format_priority(priority)
    value = " ⇧".colorize(:red) if priority == "high"
    value = " ⇨".colorize(:green) if priority == "medium"
    value = " ⇩".colorize(:blue) if priority == "low"
    value = "" if !priority
    return value
  end        
end
