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
            expect{ subject.top_up 100 }.to raise_error "Error: Maximum limit of #{Oystercard::MAX_LIMIT.to_s} reached"
        end
    end

    # describe '#deduct' do
    #   it 'it reduces the card balance by specified amount' do
    #     subject.top_up(40)
    #     expect{ subject.deduct(20) }.to change{ subject.balance }.by (-20)
    #   end
    # end

    describe 'journey status' do
      it 'shows if card is in journey' do
        expect(subject.in_journey?).to eq false
      end
    end

    describe '#touch_in' do
      it 'shows card is in journey after touching in' do
        subject.top_up(10)
        subject.touch_in
        expect(subject.in_journey?).to eq true
      end
    end

    describe '#touch_out' do
      it 'shows card is not in journey after touching in then touching out again' do
        subject.top_up(10)
        subject.touch_in
        subject.touch_out
        expect(subject.in_journey?).to eq false
      end

      it 'reduces balance by minimum fare on touch out' do
        subject.top_up(10)
        subject.touch_in
        expect{ subject.touch_out }.to change{ subject.balance }.by (-Oystercard::MIN_FARE)
      end
    end

    describe 'minimum value' do
        it 'raises an error when touching in with a balance less or equal to one' do
            expect{ subject.touch_in }.to raise_error "Not enough credit"
        end
    end

end
