require 'rails_helper'

describe User do
  describe 'mark list as favorite' do
    it 'successfuly' do
      user = build(:user)
      other_user = build(:user)
      list = build(:list, user: other_user)

      user.mark_favorite(list)
      expect(user.favorite_list?(list)).to be true
    end
  end
end
