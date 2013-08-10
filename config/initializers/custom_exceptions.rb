class CreditPurchaseError < StandardError

	def initialize(failed_action, message)
		@failed_action = failed_action
		@message = message
	end

end

class CreditExchangeError < StandardError

	def initialize(failed_action, message)
		@failed_action = failed_action
		@message = message
	end

end

class CreditPayoutError < StandardError

	def initialize(failed_action, message)
		@failed_action = failed_action
		@message = message
	end

end
