class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :creditor

  has_many :loans 
end
