require 'station'

describe Station do
    describe "#initializes" do
        let(:name) {"Old Street"}
        let(:zone) {1}
        let(:station) {Station.new(name, zone)}

        it 'takes a zone on creation' do
            expect(station.zone).to eq zone
        end

        it 'takes a name on creation' do
            expect(station.name).to eq name
        end
    end
end