# frozen_string_literal: true
require 'rails_helper'

describe 'articleモデルのテスト' do
  it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:article)).to be_valid
  end
end