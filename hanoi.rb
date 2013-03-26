class Hanoi

	attr_accessor :left, :center, :right
	attr_reader :num_of_disk


	def initialize(num_of_disks)
		@num_of_disk = num_of_disks
		@left = Pile.new(num_of_disks)
		@center = Pile.new
		@right = Pile.new
	end

	def render
		#not testing in rspec
	end

	def move_disk(start_pile, targ_pile)
		begin
			piece = start_pile.take
			targ_pile.place(piece)
		rescue RuntimeError => e
			puts e.message
			start_pile.place(piece) unless piece.nil?
		end
	end

	def won?
		right.disks == (1..num_of_disk).to_a.reverse
	end

	def get_move
    #not testing in rspec
	end

end


class Pile
  attr_reader :disks

	def initialize(num_of_disks=0)
    @disks = (1..(num_of_disks)).to_a.reverse
		# left is bottom, right is top
	end

	def take
		if @disks.empty?
			raise "Can't take from empty pile"
		else
			@disks.pop
		end
	end

	def place(disk)
		if @disks.empty? || disk < @disks.last
		  @disks << disk
		else
		  raise "Can't place a heavier disk"
		end
	end

end

=begin
hanoi = Hanoi.new(8)
hanoi.move_disk(hanoi.left, hanoi.center)
hanoi.move_disk(hanoi.left, hanoi.center)
p hanoi.left.disks
p hanoi.center.disks
p hanoi.right.disks
=end