module Ability::Device
  def initialize(user)
    super(user)

    can :create, ::Device do |device|
      user.email_verified?
    end

    can :destroy, ::Device do |device|
      user == device.user
    end
  end
end
