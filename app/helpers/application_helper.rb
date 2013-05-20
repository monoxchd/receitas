module ApplicationHelper
	def menu
		Category.all
	end
	def flash_message
    if flash[:notice].present?
      "<p class= 'notice'> #{ flash[:notice] }</p>".html_safe
    elsif flash[:errors].present?
      "<p class= #{ error}> #{ flash[:errors] }</p>".html_safe
    end
  end
end
