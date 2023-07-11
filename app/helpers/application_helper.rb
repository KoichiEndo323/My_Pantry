module ApplicationHelper

  def flash_class_for(key)
    case key
      when 'success' then 'alert-success'
      when 'failed'   then 'alert-danger'
    end
  end


  def days_until(date)
    days = (date.to_date - Date.current).to_i
    if days > 0
      "賞味期限まであと#{days}日です。"
    elsif days < 0
      "賞味期限から#{days.abs}日経過してます。お早めにご使用して下さい"
    else
      "賞味期限は今日までです。お早めにご使用して下さい"
    end
  end
end