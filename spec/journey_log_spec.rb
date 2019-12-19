require 'journey_log'

describe JourneyLog do
    
    describe "#initialize" do

        it 'initializes with a journey object other than journey.new' do
            indie = double("indie")
            subject = JourneyLog.new(indie)
            expect(subject.journey).to eq indie
        end

        
    end
end


# start
# finish
# history
# private method #current_journey