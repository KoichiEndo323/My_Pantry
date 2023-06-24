module ApplicationHelper

  def flash_class_for(key)
    case key
      when 'success' then 'alert-success'
      when 'failed'   then 'alert-danger'
    end
  end

end
