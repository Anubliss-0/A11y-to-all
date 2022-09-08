module ApplicationHelper
  def colored_background_page
    if current_page?(root_path)
      "colored-background"
    elsif params[:action] == "new"
      "colored-background"
    elsif params[:action] == "edit"
      "colored-background"
    elsif params[:controller] == "chatrooms" && params[:action] == "index"
      "colored-background"
    elsif params[:controller] == "friendships" && params[:action] == "index"
      "colored-background"
    elsif params[:controller] == "dashboard" && params[:action] == "reccomend"
      "colored-background"
    elsif params[:controller] == "chatrooms" && params[:action] == "show"
      "colored-background"
    else
      ""
    end
  end
end
