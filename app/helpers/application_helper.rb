module ApplicationHelper
  def colored_background_page
    if current_page?(root_path)
      "colored-background"
    elsif params[:action] == "new"
      "colored-background"
    elsif params[:action] == "edit"
      "colored-background"
    else
      ""
    end
  end
end
