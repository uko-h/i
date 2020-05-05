require 'rails_helper'

describe User do
  describe '#create' do
    it "nickname,email,password全てが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "nicknameが21文字以上では登録できないこと " do
      user = build(:user, nickname: "abcdefghijklmnopqrstu")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    it "emailが空では登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "重複したemailが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "emailが正規表現にマッチしなければ登録できないこと" do
      user = build(:user, email: "aaabbb.ccc")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordが空では登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "password_confirmationとpasswordが一致しなければ登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "passwordが8文字以上であれば登録できること" do
      user = build(:user, password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが7文字以下であれば登録できないこと" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password]).to include("は8文字以上で入力してください")
    end
  end
end
