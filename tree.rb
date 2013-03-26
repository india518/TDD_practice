class TreeNode
	attr_accessor :value, :children, :parent

	def initialize(value)
		@value = value
		@parent = nil
		@children = []
	end

	def add_child(child)
		self.children << child
		child.parent = self
	end

	def dfs(target)
		return self if value == target
		return nil if children.empty?
		found_node = nil
		children.each do |child|
			found_node = child.dfs(target)
			break if found_node
		end
		found_node
	end

	def bfs(target)
		queue = [self]

		until queue.empty?
			node = queue.shift
			return node if node.value == target
			queue += node.children
		end
		nil
	end


end

parent = TreeNode.new(12)
child1 = TreeNode.new(3)
child2 = TreeNode.new(4)
parent.add_child(child1)
parent.add_child(child2)
