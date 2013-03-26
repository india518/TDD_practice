require 'rspec'
require_relative 'array'

describe Array do

	describe "#my_uniq" do

		it "removes duplicates from array" do
			[1,1,2,3,4,3].my_uniq.should == [1,2,3,4]
		end

		it "doesn't remove things when there are no duplicates" do
			[5,7,3,9].my_uniq.should == [5,7,3,9]
		end

		it "preserves the order" do
			[1,2,4,5,1,6,4,5].my_uniq.should == [1,2,4,5,6]
		end

		it "returns an empty array for an empty array" do
			[].my_uniq.should == []
		end


	end

	describe "#two_sum" do

		it "checks if array has two numbers that sum to zero" do
			[1,2,3,-2].two_sum.should be_true
		end

		it "false for one zero, true for >2 zeros" do
			[3,7,0,5,0].two_sum.should be_true

			[3,7,0,5,1].two_sum.should be_false
		end

		it "returns false for empty array" do
			[].two_sum.should be_false
		end

	end
end