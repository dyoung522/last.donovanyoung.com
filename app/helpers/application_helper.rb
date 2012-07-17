module ApplicationHelper
  def page_heading(page_title)
    if page_title.empty?
      "Donovan C. Young"
    else
      page_title
    end
  end

  def is_active(page)
    action_name == page ? 'active' : 'not-active'
  end
end
