class Blog < ApplicationRecord
  before_destroy :check_if_deletable

  private

  def check_if_deletable
    # 削除可能かどうかのチェック
    if some_condition
      errors.add(:base, "削除できません")
      throw(:abort)
    end
  end
end