# frozen_string_literal: true

require 'rails_helper'

describe '食材登録のテスト' do
  let!(:food) { create(:food, image:"image", name:'hoge',quantity:1,start_day) }
  describe 'トップ画面(top_path)のテスト' do
    before do
      visit top_path
    end
    context '表示の確認' do
      it 'トップ画面(top_path)に「ここはTopページです」が表示されているか' do
        expect(page).to have_content 'ここはTopページです'
      end
      it 'top_pathが"/top"であるか' do
        expect(current_path).to eq('/top')
      end
    end
  end