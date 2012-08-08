

module Model
	@name = __FILE__.chomp('.rb')
	class << self 
		attr_reader :name
	end
	
	def suverify_reqs # Required fields
		return %w{pass email}
	end
	module_function :suverify_reqs
	
	def suverify(arr_in)
		print "-"*40
		print "\n"
		print "#{__FILE__.chomp('.rb').split("/")[-1]} has successfully retrieved the following. \n"
		print "E-Mail: #{arr_in['email']} \n"
		print "Password: #{arr_in['pass']} \n"
		print "\n"
	end
	module_function :suverify
end
