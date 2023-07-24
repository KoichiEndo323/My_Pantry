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

  def default_meta_tags
    {
      site: 'My Pantry',
      title: 'My Pantry',
      reverse: true,
      charset: 'utf-8',
      description: '食材の在庫・賞味期限管理＆情報共有サービス',
      keywords: '食材管理,賞味期限管理,在庫管理',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('My_Pantry_Logo.svg') },
        { href: image_url('My_Pantry_Logo.svg'), rel: 'apple-touch-icon', type: 'image/svg' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('My_Pantry_Logo.svg'),
        local: 'ja-JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@MyPantry_PF',
        image: image_url('My_Pantry_Logo.svg')
      }
    }
  end
end