
$all_models = %w{ model_a } 

module ControllerPL
	@sampleDB = ["user" => "KingOfWorld", "pass" => "IAmLegend", "email" => "BowToMe@MyDomain.gov", "firstname" => "Jean", "lastname" => "Jeffries"]
	class << self
		# Returns the sampleDB values.
		attr_accessor :sampleDB
	end
	
	def requestor(modulePL)
		return modulePL::reqs
	end
	module_function :requestor
	
	def lookup(reqslist)
		dbReply = {}
		reqslist.each do |val|
			dbReply[val] = sampleDB[0][val] # FIXME figure out HASH exchange.
		end
		return dbReply
	end
	module_function :lookup
end

$all_models.each do |model|
	require model
	giveMeReqs = ControllerPL.requestor(eval(model.capitalize))
	giveMeReqVals = ControllerPL.lookup(giveMeReqs)
	eval(model.capitalize)::signup(giveMeReqVals)
end
