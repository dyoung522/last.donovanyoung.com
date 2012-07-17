module ApplicationHelper
  def page_heading(page_title)
    if page_title.empty?
      "Donovan C. Young"
    else
      page_title
    end
  end
end
