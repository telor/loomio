require 'rails_helper'

describe API::DevicesController do
  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:device) { create :device, user: user }
  let(:another_device) { create :device, user: another_user }
  let(:device_params) {{ token: "token" }}

  describe 'create' do
    it 'can create a device' do
      sign_in user
      expect { post :create, params: { device: device_params } }.to change { user.devices.count }.by(1)
      expect(response.status).to eq 200
    end

    it 'does not let unverified users create devices' do
      sign_in user
      user.update(email_verified: false)
      expect { post :create, params: { device: device_params } }.to_not change { user.devices.count }
      expect(response.status).to eq 403
    end

    it 'does not let logged out users create devices' do
      expect { post :create, params: { device: device_params } }.to_not change { Device.count }
      expect(response.status).to eq 403
    end
  end

  describe 'destroy' do
    it 'can destroy a device' do
      sign_in user
      device
      expect { delete :destroy, params: { id: device.id } }.to change { user.devices.count }.by(-1)
      expect(response.status).to eq 200
    end

    it 'does not let you destroy some elses device' do
      sign_in user
      another_device
      expect { delete :destroy, params: { id: another_device.id } }.to_not change { user.devices.count }
      expect(response.status).to eq 403
    end
  end
end
