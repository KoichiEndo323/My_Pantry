class Food < ApplicationRecord

  has_many :notifications, dependent: :destroy
  belongs_to :strage
  belongs_to :end_user




end
