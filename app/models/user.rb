# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  # acts_as_token_authenticatable
  validates :email, presence: true, format: Devise.email_regexp

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  has_many :slots
end
