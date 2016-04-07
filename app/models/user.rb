class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :favorite_list

  def mark_favorite(list)
    @favorite_list = FavoriteList.new(user: self, list: list)
    @favorite_list.save
  end

  def favorite_list?(list)
    FavoriteList.where(user: self, list: list).present?
  end
end
