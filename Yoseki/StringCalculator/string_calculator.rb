class StringCalculator
	def self.add(params)
		result = 0
		numbers = []
		delimiters = [",", "\n"]
		next_delimiter = ""
		negatives_found = false
		negatives = []
		numbers_section = params
		delimiters_section = ""

		if (params[0, 2] == "//")
			delimiters_section = params[2..params.index("\n")-1]
			numbers_section = params[delimiters_section.size..params.size]

			delimiters_section.split(/[\[\]]/).each do |new_delimiter|
				if new_delimiter != ""
					delimiters << new_delimiter
				end
			end
		end

		delimiters.each do |delimiter|
			if next_delimiter != ""
				numbers_section = numbers_section.split(next_delimiter).join(delimiter)
			end
			next_delimiter = delimiter
		end
		numbers = numbers_section.split(next_delimiter)

		numbers.each do |number|
			if number.to_i < 0
				negatives_found = true
				negatives << number
			else
				if number.to_i <= 1000
					result += number.to_i
				end
			end
		end

		if negatives_found
			result = "negatives not allowed, " + negatives.join(", ")
		end

		result
	end
end
