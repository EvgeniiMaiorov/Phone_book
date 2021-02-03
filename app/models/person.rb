class Person < ApplicationRecord
    has_many :email_addresses
    has_many :phone_numbers
    accepts_nested_attributes_for :email_addresses, :phone_numbers
end
