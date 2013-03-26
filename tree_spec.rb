require 'rspec'
require_relative 'tree'

describe TreeNode do

  subject(:tree_root) do
		TreeNode.new(1)
	end

  its(:parent) { should == nil}
	its(:value) { should == 1 }
	its(:children) {should == []}

	describe "#add_child" do
	  let(:child) { TreeNode.new(10) }

		it "adds a child node to the current node" do
			tree_root.add_child(child)
			tree_root.children.should include(child)
			child.parent.should == tree_root
		end

	end

	let(:parent) { TreeNode.new(1) }
	let(:child1a) { TreeNode.new(20) }
	let(:child2a) { TreeNode.new(25) }
	let(:child3a) { TreeNode.new(35) }
	let(:gchild1b)  { TreeNode.new(101) }
	let(:gchild1c)  { TreeNode.new(102) }
	let(:gchild2b)  { TreeNode.new(103) }
	let(:gchild3b)  { TreeNode.new(104) }
	let(:gchild3c)  { TreeNode.new(105) }

  describe "dfs" do
   	it "finds the root node" do
			parent.add_child(child1a)
			parent.add_child(child2a)

			parent
			  .should_receive(:value)
				.ordered
				.and_call_original
			child1a.should_not_receive(:value)
			child2a.should_not_receive(:value)
			parent.dfs(1).should == parent
		end

    it "finds the first child" do
			parent.add_child(child1a)
			parent.add_child(child2a)
			parent.add_child(child3a)
			child1a.add_child(gchild1b)
			child1a.add_child(gchild1c)
			child2a.add_child(gchild2b)
			child3a.add_child(gchild3b)
			child3a.add_child(gchild3c)

			parent
			  .should_receive(:value)
				.ordered
				.and_call_original
		  child1a
			  .should_receive(:value)
				.ordered
				.and_call_original
			child2a.should_not_receive(:value)
			gchild1b.should_not_receive(:value)
			gchild1c.should_not_receive(:value)
			parent.dfs(20).should == child1a
		end

		it "finds gchild 1c in the right order" do
			parent.add_child(child1a)
			parent.add_child(child2a)
			parent.add_child(child3a)
			child1a.add_child(gchild1b)
			child1a.add_child(gchild1c)
			child2a.add_child(gchild2b)
			child3a.add_child(gchild3b)
			child3a.add_child(gchild3c)

			parent
			  .should_receive(:value)
				.ordered
				.and_call_original
		  child1a
			  .should_receive(:value)
				.ordered
				.and_call_original
			gchild1b
			  .should_receive(:value)
				.ordered
				.and_call_original
			gchild1c
			  .should_receive(:value)
				.ordered
				.and_call_original
			child2a.should_not_receive(:value)
			child3a.should_not_receive(:value)
			gchild2b.should_not_receive(:value)
			gchild3b.should_not_receive(:value)
			gchild3c.should_not_receive(:value)
			parent.dfs(102).should == gchild1c
	  end
	end

	describe "#bfs" do

		it "finds the root node" do
			parent.add_child(child1a)
			parent.add_child(child2a)
			parent.add_child(child3a)
			child1a.add_child(gchild1b)
			child1a.add_child(gchild1c)
			child2a.add_child(gchild2b)
			child3a.add_child(gchild3b)
			child3a.add_child(gchild3c)

			parent
			  .should_receive(:value)
				.ordered
				.and_call_original
			child1a.should_not_receive(:value)
			child2a.should_not_receive(:value)
			child3a.should_not_receive(:value)
			parent.bfs(1).should == parent
		end

    it "finds the first child" do
			parent.add_child(child1a)
			parent.add_child(child2a)
			parent.add_child(child3a)
			child1a.add_child(gchild1b)
			child1a.add_child(gchild1c)
			child2a.add_child(gchild2b)
			child3a.add_child(gchild3b)
			child3a.add_child(gchild3c)

			parent
			  .should_receive(:value)
				.ordered
				.and_call_original
			child1a
			  .should_receive(:value)
				.ordered
				.and_call_original
			child2a.should_not_receive(:value)
			child3a.should_not_receive(:value)
			gchild1b.should_not_receive(:value)
			gchild1c.should_not_receive(:value)

			parent.bfs(20).should == child1a
		end

    it "finds an element in the third row (third grandchild)" do
			parent.add_child(child1a)
			parent.add_child(child2a)
			parent.add_child(child3a)
			child1a.add_child(gchild1b)
			child1a.add_child(gchild1c)
			child2a.add_child(gchild2b)
			child3a.add_child(gchild3b)
			child3a.add_child(gchild3c)

			parent
			  .should_receive(:value)
				.ordered
				.and_call_original
			child1a
			  .should_receive(:value)
				.ordered
				.and_call_original
		  child2a
			  .should_receive(:value)
				.ordered
				.and_call_original
		  child3a
			  .should_receive(:value)
				.ordered
				.and_call_original
			gchild1b
			  .should_receive(:value)
				.ordered
				.and_call_original
		  gchild1c
			  .should_receive(:value)
				.ordered
				.and_call_original
		  gchild2b
			  .should_receive(:value)
				.ordered
				.and_call_original
			gchild3b.should_not_receive(:value)
			gchild3c.should_not_receive(:value)

			parent.bfs(103).should == gchild2b
		end

    it "doesn't find something not in the tree" do
			parent.add_child(child1a)
			parent.add_child(child2a)
			parent.add_child(child3a)
			child1a.add_child(gchild1b)
			child1a.add_child(gchild1c)
			child2a.add_child(gchild2b)
			child3a.add_child(gchild3b)
			child3a.add_child(gchild3c)

			parent
			  .should_receive(:value)
				.ordered
				.and_call_original
			child1a
			  .should_receive(:value)
				.ordered
				.and_call_original
		  child2a
			  .should_receive(:value)
				.ordered
				.and_call_original
		  child3a
			  .should_receive(:value)
				.ordered
				.and_call_original
			gchild1b
			  .should_receive(:value)
				.ordered
				.and_call_original
		  gchild1c
			  .should_receive(:value)
				.ordered
				.and_call_original
		  gchild2b
			  .should_receive(:value)
				.ordered
				.and_call_original
			gchild3b
        .should_receive(:value)
				.ordered
				.and_call_original
			gchild3c
      .should_receive(:value)
			.ordered
			.and_call_original

			parent.bfs(404).should == nil
		end

	end

end

#REV Awesome!