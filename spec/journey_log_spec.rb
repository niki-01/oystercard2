require 'journey_log'

describe JourneyLog do
    
    describe "#initialize" do
        it 'initializes with a journey object' do
            indie = double("indie")
            subject = JourneyLog.new(indie)
            expect(subject.journey_object).to eq indie
        end

        it 'if journey is nil, initializes with Journey.new' do
            subject = JourneyLog.new(nil)
            expect(subject.journey_object).to be_an_instance_of(Journey)
        end
    end

    describe "#start" do
        let(:old_street) {"Old Street"}

        it 'starts a new journey with an entry station' do
            subject = JourneyLog.new(nil)
            subject.start(old_street)
            expect(subject.entry_station).to eq old_street
        end
    end



end

# finish
# history
# private method #current_journey