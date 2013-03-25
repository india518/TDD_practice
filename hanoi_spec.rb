require 'rspec'
require_relative 'hanoi'

describe Pile do

	pile = Pile.new(6)
	empty_pile = Pile.new

	describe "#initialize" do

		it "should contain a disk array" do
      pile.disks.class.should be == Array
		end

		it "should go from highest to lowest number" do
			pile.disks.should == [6, 5, 4, 3, 2, 1]
		end

		it "should contain an empty array" do
			empty_pile.disks.should == []
		end

	end

	describe "#take" do
		it "should remove the last disk from the pile" do
  		pile.take.should == 1
			pile.disks.should == [6,5,4,3,2]
		end

		it "should not allow a move from an empty pile" do
			expect do
				empty_pile.take
			end.to raise_error("Can't take from empty pile")
		end
	end

	describe "#place" do
		it "should add disk to the pile" do
  		pile.place(1)
			pile.disks.should == [6,5,4,3,2,1]
		end

		it "should not allow a heavier disk on a lighter disk" do
			expect do
				pile.place(3)
			end.to raise_error("Can't place a heavier disk")
		end
	end

end

describe Hanoi do

	game = Hanoi.new(8)

	describe "#initialize" do
		game.left.disks.should == (1..8).to_a.reverse
		game.center.disks.should == []
		game.right.disks.should == []
	end

	describe "#move_disk" do
		it "takes a disk from one pile and places it on another" do
			game.move_disk(game.left, game.center)

			game.left.disks.should == (2..8).to_a.reverse
			game.center.disks.should == [1]
		end

		it "can't move large disk on small" do
			game.move_disk(game.left, game.center)
			game.left.disks.should == (2..8).to_a.reverse
			game.center.disks.should == [1]
		end

		it "doesn't move from an empty pile" do
			game.move_disk(game.right, game.center)
			game.center.disks.should == [1]
			game.right.disks.should == []
		end
	end

	describe "#render" do
		it "displays the three towers"
	end

	describe "won?" do
		it "detects a win" do
			right = double("pile")
			right.stub(:disks => [8,7,6,5,4,3,2,1])
			game.right = right
			game.should be_won
		end
	end

	describe "get_move" do
		it "gets a move from user" do

			game
			  .should_recieve(:move_disk)
				.with(game.left, game.right)
			game.get_move
			# make sure to type in left, right
		end

	end

end

