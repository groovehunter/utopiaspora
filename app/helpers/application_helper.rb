module ApplicationHelper
  
  def page_title(text=nil)
    
    return text unless text.blank?
    "utopiaspora"
  end
end
