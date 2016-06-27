class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    check_priority
  end

  def check_priority
    if ["high", "medium", "low", nil].include? @priority
      @priority
    else
      raise UdaciListErrors::InvalidPriorityValue, "#{@priority} is invalid priority value."
    end
  end

  def details
    format_description(@description) + "due: " +
    format_date(@due) +
    format_priority(@priority)
  end
end
