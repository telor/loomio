class DeviceService
  def self.create(device:, actor:)
    actor.ability.authorize! :create, device

    device.assign_attributes(user: actor)
    return false unless device.valid?

    device.save!

    EventBus.broadcast 'device_create', device, actor
  end

  def self.destroy(device:, actor:)
    actor.ability.authorize! :destroy, device

    device.destroy

    EventBus.broadcast 'device_destroyed', device, actor
  end
end
