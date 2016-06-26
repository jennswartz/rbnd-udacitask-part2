module Listable
  def format_description(description)
    "#{description}".ljust(25)
  end

  def format_date(start_date, end_date = nil)
    dates = start_date.strftime("%D") if start_date
    dates << " -- " + end_date.strftime("%D") if end_date
    dates = "N/A" if !dates
    return dates
  end      

end
