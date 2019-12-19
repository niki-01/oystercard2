require 'journey_log'

describe JourneyLog do
    
    subject { JourneyLog.new(Journey)}

    describe "#initialize" do

        it 'if journey is nil, initializes with Journey.new' do
            expect(subject.journey_class).is_a?(Journey)
        end
    end

    describe "#start" do
        let(:old_street) {"Old Street"}

        it 'starts a new journey with an entry station' do
            expect(subject.instance_variable_get(:@current_journey)).to receive(:starts).with(old_street)
            subject.start(old_street)
        end
    end

    describe "#finish" do
        let(:kings_cross) {"Kings Cross"}

        it "adds an exit station to the current_journey" do
            expect(subject.instance_variable_get(:@current_journey)).to receive(:ends).with(kings_cross)
            subject.finish(kings_cross)
        end
    end
end

