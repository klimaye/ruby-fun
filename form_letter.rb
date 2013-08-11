class FormLetter < Document
	def replace_word(old_word, new_word)
		@contents.gsub!(old_word, "#{new_word}")
	end

	def method_missing(name, *args)
		string_name = name.to_s
		return super unless string_name =~ /^replace_\w+/
		old_word = extract_old_word(string_name)
		@contents.gsub!(old_word, args.first)
	end

	def extract_old_word(name)
		name_parts = name.split('_')
		return name_parts[1].upcase
	end
end