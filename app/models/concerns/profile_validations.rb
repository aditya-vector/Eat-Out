module ProfileValidations
  extend ActiveSupport::Concern

  included do
    validates_presence_of :name
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  end
end