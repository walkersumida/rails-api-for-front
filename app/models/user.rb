# frozen_string_literal: true

require 'carrierwave/orm/activerecord'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  mount_uploader :image, Uploaders::UserProfile

  has_many :posts, dependent: :destroy

  before_validation :generate_uuid

  def generate_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
