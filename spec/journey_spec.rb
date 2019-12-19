require 'journey'

describe Journey do

    describe '#initialize' do
        it 'journeys array is empty by default' do
            expect(subject.history).to eq []
        end
    end
    
    describe '#status?' do
        it 'shows if card is in journey' do
            expect(subject.status?).to eq false
        end
    end

    describe '#starts' do
        let(:old_street) {"Old Street"}

        it 'shows card is in journey after touching in' do
            subject.starts(old_street)
            expect(subject.status?).to eq true
        end
        
        it 'returns entry station after touch in' do
            subject.starts(old_street)
            expect(subject.entry_station).to eq old_street
        end
    end

    describe '#ends' do
        let(:old_street) {"Old Street"}
        let(:kings_cross) {"Kings Cross"}
        before(:each) {subject.starts(old_street)}
    
        it 'shows card is not in journey after touching in then touching out again' do
            subject.ends(kings_cross)
            expect(subject.status?).to eq true
        end

        it 'after touching out, journey is recorded' do
            subject.ends(kings_cross)
            expect(subject.history[0]).to eq({:touch_in => old_street, :touch_out => kings_cross})
        end

        it 'after touching out, exit station is set' do
            expect{ subject.ends(kings_cross) }.to change{ subject.exit_station }.to kings_cross
        end
    end

    describe '#fare' do
        let(:old_street) {"Old Street"}
        let(:kings_cross) {"Kings Cross"}

        it 'returns the minimum fare if touch in and touch out' do
            subject.starts(kings_cross)
            subject.ends(old_street)
            expect(subject.fare).to eq Journey::MIN_FARE
        end

        it 'returns penalty fare if touch out, but no touch in' do
            subject.ends(old_street)
            expect(subject.fare).to eq Journey::PENALTY_FARE
        end

        it 'returns penalty fare if touch in, but no touch out' do
            subject.starts(kings_cross)
            expect(subject.fare).to eq Journey::PENALTY_FARE
        end
    end

    describe "#reset" do
        let(:old_street) {"Old Street"}

        it 'resets the entry and exit stations' do
            subject.starts("Old Street")
            subject.reset
            expect(subject.entry_station).to eq nil
        end
    end
end