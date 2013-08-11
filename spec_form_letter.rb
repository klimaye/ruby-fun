require_relative 'document'
require_relative 'form_letter'

describe FormLetter do
	before :each do
		@offer_letter = FormLetter.new( "Special Offer", "Acme Inc",
		%q{
		    Dear Mr. LASTNAME
		    Are you troubled by the heartache of hangnails?
		    ...
		    FIRSTNAME, we look forward to hearing from you.
		})		
	end
	it 'should support missing methods in the format replace_' do
		@offer_letter.replace_firstname('John')
		@offer_letter.contents.include?('John').should == true
		@offer_letter.replace_lastname('Doe')
		@offer_letter.contents.include?('Doe').should == true
	end
	it 'should raise RuntimeError when method missing convention broken' do
		lambda { @offer_letter.sub_firstname }.should raise_error(RuntimeError, 'sub_firstname method not found')
	end
end