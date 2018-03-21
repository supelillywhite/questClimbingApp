require 'rails_helper'
require 'spec_helper'
#This is a file where I can learn about and test out different rspec stuff. It has nothing to do with this app

describe 'an array of animals' do
  let(:animal_array) { [:cat, :dog, :mule] } #When you use let to create a variable, it creates the variable and let's it be reused for every test. Here are a few more examples:
  let(:example_text) { "Hippies are bad" }
  let(:example_number) {5}
  let(:example_number_2) {6}

  context 'general tests' do 
	  it 'has three animals' do
	    expect(animal_array.size).to eq(3)
	  end

	  it 'checks if Hippies are bad' do
	  	expect(example_text).to eq("Hippies are bad")
	  end

	  it 'multiplies by 3' do
	  	expect(example_number * 3).to eq(15)
	  end

	  it 'can have animals added' do
	  	animal_array << :cow
	  	expect(animal_array).to eq([:cat, :dog, :mule, :cow])
	  end

	  it 'can have animals removed' do
	  	animal_array.pop
	  	expect(animal_array). to eq([:cat, :dog])
	  end

	  it "checks if values are equal" do
	  	first = example_number
	  	second = example_number
	  	expect(first).to be(second)
	  end

	  it "checks if one is less" do
	  	expect(example_number).to be < example_number_2
	  	puts "THIS IS STILL WORKING!!!!"
	  end
	end
end

#Subject test class examples. Use subject type methods to access the spec class itself.
describe Array do
	it 'provides methods based on the `RSpec.describe` argument' do
		#described_class = Array
		expect(described_class).to be(Array)
		#subject = described_class.new
		expect(subject).to eq(Array.new)
		#is_expected = expect(subject)
		is_expected.to eq(Array.new)
	end

	context 'explicitly defined subject' do
		#subject can be manually defined
		subject { [1,2,3] }
		it 'is not empty' do
			is_expected.not_to be_empty
		end
	end

	context 'can be named' do
		#you can provide a name, just like 'let'
		subject(:bananas) { [4,5,6] }
		it 'can be called by name' do
			expect(bananas.first).to eq(4)
			expect(bananas.length).to eq(3)
		end
	end
end

#My subject examples
describe String do
	it 'checks that it is a new string' do
		is_expected.to eq(String.new)
	end

	context 'tests on the string' do
		subject(:my_string) { "Nice!"}
		it 'is not empty' do
			is_expected.not_to be_empty
		end

		it 'is 5 long' do
			expect(subject.length).to eq(5)
		end

		it 'has the right value' do
			is_expected.to eq("Nice!")
		end
	end
end

#Before and after hook examples. They are run each time an it do block is called so be careful with them.
describe 'Hooks1' do
	order = []
	before { order << 'hey' }
	after { order << 'guys'; p order }

	it "prints out order" do
		order << "there"
		expect(order).to eq(['hey', 'there'])
	end
end

describe 'Hooks2' do
	num = 7
	before { num += 7 }
	after {num += 7; p num }

	it "prints out bum" do
		num += 7
		expect(num).to eq(21)
	end
end

#How you can skip tests. This temporarily prevents the tests from being run
describe "skipper" do
	skip "uses 'skip' instead of 'it' to skip the test" do
		puts "This should be skipped because of 'skip'"
	end

	xit "uses 'xit' instead of 'it' to skip the test" do
		puts "This should be skipped because of 'xit'"
	end

	xcontext "uses 'xcontext' to skip multiple test" do
		it "won't run" do; end
		it "won't run either" do; end
	end
end

#How you can mark tests as pending. You would mark tests as pending that you know won't pass but don't want to get a red error for now
describe "Ways to mark failing tests as 'pending'" do
	pending 'has a failing expection' do
		expect(1).to eq(2)
	end

	it "has 'pending' in the body" do
		pending('reason goes here: 1 != 2')
		expect(1).to eq(2)
	end

	pending 'tells you if a pending test has been fixed' do
		#If a test marked as pending passes, it will fail and give you a message saying it has been fixed
		expect(2).to eq(2)
	end
end

#You can define arbitrary methods for use within your tests
describe 'Defining methods' do
	def my_helper_method(name)
		"Hello #{name}, you just got helped!"
	end

	it 'uses my_helper_method' do
		message = my_helper_method('Supe')
		expect(message).to eq("Hello Supe, you just got helped!")
	end
end

#Shared tests are tests that can be resued inside of other tests...
shared_examples 'test on an array' do
	it 'has a size' do
	  expect(subject.size).to be > 0
	  expect(subject[1]).to eq('one')
	  expect(subject.size).to eq(3)
	end
end

describe 'A real array' do
	def adder_method
		subject << 'three'
	end

  include_examples 'test on an array' do
  	subject { ['zero', 'one', 'two'] }
  end
end

describe "test number" do

end













