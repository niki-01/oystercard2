require 'journey'

describe Journey do

    it 'journeys is empty by default' do
        expect(subject.journeys).to eq []
    end

    describe '#in_journey?' do
        it 'shows if card is in journey' do
            expect(subject.in_journey?).to eq false
        end
    end

    describe '#starts' do
        let(:old_street) {"Old Street"}

        it 'shows card is in journey after touching in' do
            subject.starts(old_street)
            expect(subject.in_journey?).to eq true
        end
        
        it 'returns entry station after touch in' do
            subject.starts(old_street)
            expect(subject.entry_station).to eq old_street
        end
    end

    describe '#ends' do
        let(:old_street) {"Old Street"}
        let(:kings_cross) {"Kings Cross"}
        before(:each) do 
        subject.starts(old_street)
        end
    
        it 'shows card is not in journey after touching in then touching out again' do
            subject.ends(kings_cross)
            expect(subject.in_journey?).to eq false
        end

        it 'after touching out, journey is recorded' do
            subject.ends(kings_cross)
            expect(subject.journey_number(1)).to eq({:touch_in => old_street, :touch_out => kings_cross})
        end

        it 'after touching out, entry station returns nil' do
            expect{ subject.ends(kings_cross) }.to change{ subject.entry_station }.to nil
        end

        it 'after touching out, exit station is set' do
            expect{ subject.ends(kings_cross) }.to change{ subject.exit_station }.to kings_cross
        end
    end

end