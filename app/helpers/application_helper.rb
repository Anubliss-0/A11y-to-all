module ApplicationHelper
  def colored_background_page
    if current_page?(root_path)
      "colored-background"
    elsif current_page?(action: :new)
      "colored-background"
    elsif current_page?(action: :edit)
      "colored-background"
    end
  end
end
