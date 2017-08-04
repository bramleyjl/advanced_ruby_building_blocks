require_relative '../project2_enumerables.rb'
module Enumerable

	describe "#my_each" do
		context "test with an array" do
			it "enumerates multiple values" do
				expect{ ([1, 2, 3].my_each {|n| n + 1}).to yield_successive_args(2,3,4) }
			end

			it "enumerates one value" do
				expect{ ([1].my_each {|n| n + 1}).to yield_successive_args(2) }
			end

			it "returns nil when given no value" do 
				expect([].my_each {|n| n + 1}).to be_nil
			end
		end
	end

	describe "#my_select" do
		context "test with an array" do
			let(:array){ [1, 5, 800] }

			it "selects a single value out of multiple" do
				expect(array.my_select {|n| n > 10}).to eq([800])
			end

			it "returns an empty array when no match occurs" do
				expect(array.my_select { |n| n < 0}).to eq([])
			end

			it "returns an empty array when given no value" do
				expect([].my_select {|n| n > 0}).to eq([])
			end
		end
	end

	describe "#my_all" do
		context "test with an array" do
			let(:array){ [1, 2, 3, 4] }

			it "returns true when given an empty array" do
				expect([].my_all? {|n| n > 0}).to be true
			end

			it "returns false when a value evaluates to false" do
				expect(array.my_all? {|n| n%2 == 0}).to be false
			end

			it "returns true when all values evaluate true" do
				expect(array.my_all? {|n| n <= 4}).to be true
			end
		end
	end

	describe "#my_count" do
		context "test with an array" do
			let(:array){ [1, 2, 3, 4] }

			it "returns the length of the array when given no block" do
				expect(array.my_count).to eq(4)
			end

			it "returns 2 when given { |n| n > 2 }" do
				expect(array.my_count {|n| n > 2}).to eq(2)
			end
		end
	end

	describe "#my_map" do
		context "test with an array" do
			let(:array){ [1, 2, 3, 4] }

			it "returns [1, 4, 27, 256 when given { |n| n**n }" do
				expect(array.my_map {|n| n**n}).to eq([1, 4, 27, 256])
			end
		end
	end

end