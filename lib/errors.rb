module UdaciListErrors
  class InvalidItemType < StandardError
  end
  
  class IndexExceedsListSize < StandardError
  end
  
  class InvalidPriorityValue < StandardError
  end
  
  class InvalidListFilterType < StandardError
  end
end
