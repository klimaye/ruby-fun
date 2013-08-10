require 'delegate'

class DocumentWrapper < SimpleDelegator
	def initialize(model_doc)
		super(model_doc)
	end
	#ADD additional methods here. everything else is delegated to constructor param.
end