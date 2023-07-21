# frozen_string_literal: true
require 'rails_helper'

describe 'foodモデルのテスト' do
  it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:food)).to be_valid
  end

  it "空の投稿内容の場合はエラーが出るか" do
    food.content = ""
    expect(food).to_not be_valid
  end

end