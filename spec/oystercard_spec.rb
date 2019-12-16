require 'oystercard'

describe Oystercard do

    describe 'initialize' do
        it 'initializes with a default balance' do
            expect(subject.balance).to eq 0
        end
    end

    describe 'top_up' do
        it 'tops up with the top up value as the argument' do
            subject.top_up(15)
            expect(subject.balance).to eq 15
        end
    end
end