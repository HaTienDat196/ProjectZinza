require "rails_helper"
 RSpec.describe Category, type: :model do
     context "associations" do
        it {is_expected.to have_many :products }
     end
     context "validates" do
         # We will type something later
     end
 end