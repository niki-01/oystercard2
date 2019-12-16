require 'oystercard'

describe Oystercard do

    describe '#initialize' do
        it 'initializes with a default balance' do
            expect(subject.balance).to eq 0
        end
    end

    describe '#top_up' do
        it 'tops up with the top up value as the argument' do
            expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
        end

        it 'raises an error if the action would take the card beyond the limit' do
            expect{ subject.top_up 100 }.to raise_error "Error: Maximum limit of #{Oystercard::LIMIT.to_s} reached"
        end
    end

    describe '#deduct' do
      it 'it reduces the card balance by specified amount' do
        subject.top_up(40)
        expect{ subject.deduct(20) }.to change{ subject.balance }.by (-20)
      end
    end
end
