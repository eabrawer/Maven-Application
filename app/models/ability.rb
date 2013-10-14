class Ability
	include CanCan::Ability

	def initializer(user)
		can :read, :all
	end

end