require 'rails_helper'

RSpec.describe Ticket, type: :model do

    it 'exists' do
        Ticket.new
    end

    #{id}

    it 'has a string representation that is the name' do
        #???
        # r = Ticket.new(Ticket: '')
        # expect(r.to_s).to eq('FAKE')
    end

end
