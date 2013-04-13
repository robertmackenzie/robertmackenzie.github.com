#def truncatewords(input, words = 15, truncate_string = "...")
#   if input.nil? then return end
#   wordlist = input.to_s.split
#   l = words.to_i - 1
#   l = 0 if l < 0
#   wordlist.length > l ? wordlist[0..l].join(" ") + truncate_string : input
#end

module Jekyll
   module CustomFilters
      def truncate_words_and_keep_lines(input, words = 15, truncate_string = "...") 
	 chunks = input.scan(/^.+[\r\n]*/)
	 wordlist = chunks.flat_map{ | chunk | chunk[' '] ? chunk.split(/ /) : chunk }  
	 if input.nil? then return end
	 l = words.to_i - 1
	 l = 0 if l < 0
	 wordlist.length > l ? wordlist[0..l].join(" ") + truncate_string : input
      end
   end
end

Liquid::Template.register_filter(Jekyll::CustomFilters)
