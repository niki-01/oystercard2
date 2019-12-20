require 'journey_log'

describe JourneyLog do
    
    subject { JourneyLog.new(Journey)}
    let(:old_street) {"Old Street"}
    let(:kings_cross) {"Kings Cross"}

    describe "#initialize" do
      it 'if journey is nil, initializes with Journey.new' do
        expect(subject.journey_class).is_a?(Journey)
      end

      it 'journeys array is empty by default' do
        expect(subject.history).to eq []
      end
    
    end

    describe "#start" do
        it 'starts a new journey with an entry station' do
            expect(subject.instance_variable_get(:@current_journey)).to receive(:starts).with(old_street)
            subject.start(old_street)
        end
    end

    describe "#finish" do
        it "adds an exit station to the current_journey" do
            expect(subject.instance_variable_get(:@current_journey)).to receive(:ends).with(kings_cross)
            subject.finish(kings_cross)
        end

        it "At the end of the journey, history is updated" do
          subject.start(old_street)
          subject.finish(kings_cross)
          expect(subject.history).not_to be_empty
        end
    end

    describe "#Immute" do
        it "returns the immutable journey history" do 
        subject.start(old_street)
        subject.finish(kings_cross)
        expect {subject.immute.pop}.not_to change{subject.history}
        end
    end
end
