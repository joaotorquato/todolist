require 'rails_helper'

describe ApplicationHelper, type: :helper do
  describe '#bootstrap_class_for_message' do
    it 'should returns danger when flash message is error' do
      expect(helper.bootstrap_class_for_message('error')).to eq('danger')
    end
    it 'should returns warning when flash message is alert' do
      expect(helper.bootstrap_class_for_message('alert')).to eq('warning')
    end
    it 'should returns info when flash message is notice' do
      expect(helper.bootstrap_class_for_message('notice')).to eq('info')
    end
  end
end
