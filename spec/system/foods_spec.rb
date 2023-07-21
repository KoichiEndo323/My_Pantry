require 'rails_helper'

describe '投稿のテスト' do
  let!(:food) { create(:food, name: 'hoge', quantity: 10, start_date: Time.now, end_date: Time.now + 1.day) }

  describe 'foodsテーブルのカラムのテスト' do
    it 'end_user_idカラムが存在すること' do
      expect(Food.column_names).to include('end_user_id')
    end

    it 'storage_idカラムが存在すること' do
      expect(Food.column_names).to include('storage_id')
    end

    it 'nameカラムが存在すること' do
      expect(Food.column_names).to include('name')
    end

    it 'quantityカラムが存在すること' do
      expect(Food.column_names).to include('quantity')
    end

    it 'start_dateカラムが存在すること' do
      expect(Food.column_names).to include('start_date')
    end

    it 'end_dateカラムが存在すること' do
      expect(Food.column_names).to include('end_date')
    end

    it 'memoカラムが存在すること' do
      expect(Food.column_names).to include('memo')
    end

    it 'statusカラムが存在すること' do
      expect(Food.column_names).to include('status')
    end

    it 'priceカラムが存在すること' do
      expect(Food.column_names).to include('price')
    end
  end

  describe "投稿処理のテスト" do
    before do
      visit new_food_path
      fill_in 'food[name]', with: 'Test Food'
      fill_in 'food[quantity]', with: 5
      fill_in 'food[start_date]', with: Time.now
      fill_in 'food[end_date]', with: Time.now + 3.days
      fill_in 'food[memo]', with: 'This is a test food.'
      fill_in 'food[price]', with: 100
      click_button '投稿'
    end

    context '投稿後のリダイレクト先の確認' do
      it '投稿後のリダイレクト先は正しいか' do
        expect(page).to have_current_path(food_path(Food.last))
      end
    end

    context '投稿された内容の表示の確認' do
      it '投稿された食品名が表示されているか' do
        expect(page).to have_content('Test Food')
      end

      it '投稿された数量が表示されているか' do
        expect(page).to have_content('5')
      end

      it '投稿された開始日が表示されているか' do
        expect(page).to have_content(Time.now.strftime('%Y/%m/%d %H:%M'))
      end

      it '投稿された終了日が表示されているか' do
        expect(page).to have_content((Time.now + 3.days).strftime('%Y/%m/%d %H:%M'))
      end

      it '投稿されたメモが表示されているか' do
        expect(page).to have_content('This is a test food.')
      end

      it '投稿された価格が表示されているか' do
        expect(page).to have_content('100')
      end
    end
  end
end
