class Array

	def my_uniq
		answer =[]

		self.each do |item|
			answer << item unless answer.include?(item)
		end

		answer
	end

  def two_sum

		(self.count-1).times do |index|
			return true if self[(index+1)..-1].include?(-1 * self[index])
		end
		false
	end

end