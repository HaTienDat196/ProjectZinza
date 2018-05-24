require "rails_helper"
 RSpec.describe Product, type: :model do
     context "associations" do
         it {is_expected.to belong_to :category }
         it {is_expected.to have_many :line_items }
     end
     context "validates" do
         # We will type something later
     end
 end