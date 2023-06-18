class Batch::ExpirationDateChecker
  # 賞味期限が切れていれば通知する.
  def self.check
    foods = Food.within_the_expiration_date.where(end_date: ..Time.current)
    foods.each do |food|
      food.notifications.create!(end_user: food.end_user, is_checked: false)
      food.update!(status: :expiration_date_expired)
    end
  end
end