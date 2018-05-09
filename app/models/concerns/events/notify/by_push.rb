module Events::Notify::ByPush
  def trigger!
    super
    push_to_users!
  end

  # send event emails
  def push_to_users!
    Exponent::Push::Client.new.publish push_devices.map do |device|
      { to: device.token, sound: push_sound, body: push_body(device.locale) } }
    end
  end
  handle_asynchronously :push_to_users!

  private

  def push_client
    @push_client ||= Exponent::Push::Client.new
  end

  def push_sound
    :default
  end

  def push_body(locale)
    I18n.translate(:"notifications.#{kind}", locale: locale)
  end

  # which users should receive a push notification about this event?
  # (NB: This must return an ActiveRecord::Relation)
  def push_recipients
    User.none
  end

  def push_devices
    @push_devices ||= Device.where(user: push_recipients.active.where.not(id: user))
  end
end
