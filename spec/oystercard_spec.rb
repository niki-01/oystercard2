require 'oystercard'

describe Oystercard do

    describe 'initialize' do
        it 'initializes with a default balance' do
            expect(subject.balance).to eq 0
        end
    end
end