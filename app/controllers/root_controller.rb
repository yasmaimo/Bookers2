class RootController < ApplicationController

	before_action :authenticate_user!

	def top
	end
end
