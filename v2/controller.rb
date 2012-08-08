
$all_models = %w{ model_a }

module ControllerPL
	@sampleDB = {"user" => "KingOfWorld", "pass" => "IAmLegend", "email" => "BowToMe@MyDomain.gov", "firstname" => "Jean", "lastname" => "Jeffries"}
	class << self
		# Returns the sampleDB values.
		attr_accessor :sampleDB
	end
	
	def requestor(modulePL,feature)
		feature = feature + "_reqs"
		return modulePL.module_eval(feature)
	end
	module_function :requestor
	
	def lookup(reqslist)
		dbReply = {}
		reqslist.each do |val|
			dbReply[val] = sampleDB[val]
		end
		return dbReply
	end
	module_function :lookup
end

def requestLookupDo(model,feature) # Lookup for each model feature and execute
	getReqs = ControllerPL.requestor(eval(model.capitalize),feature)
	lookupReqs = ControllerPL.lookup(getReqs)
	return eval(model.capitalize).send(feature, lookupReqs)
end

$all_models.each do |model|
	require model
	requestLookupDo(model,"signup")
	requestLookupDo(model,"login")
end
