require "rails_helper"
 RSpec.describe Cart, type: :model do
     context "associations" do
        it {is_expected.to have_many :line_items }
     end
     context "validates" do
         # We will type something later
     end
 end