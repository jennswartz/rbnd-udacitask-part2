class LinkItem
  include Listable
  attr_reader :item_type, :description, :site_name

  def initialize(item_type, url, options={})
    @item_type = item_type
    @description = url
    @site_name = options[:site_name]
  end

  def format_name
    @site_name ? @site_name : ""
  end
  
  def details
    format_description(@description, @item_type) + "site name: " + format_name
  end
end
