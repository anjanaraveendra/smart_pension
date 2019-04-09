require_relative "../spec_helper"

RSpec.describe "LogFileParser" do
  let(:logfile_path) { File.open('sample.log') }
  
  subject { ViewParser.new(logfile_path) }

  describe 'test to handle non existing file' do
    let(:logfile_path) { 'fake/path/to/file.log' }
    it 'returns nil if wrong file is passed' do
      expect(subject.parse).to eq(nil)
    end
  end

  describe '#parse' do
    before { subject.parse }

    let(:expected_response) do
      { 
        "/help_page/1"=>["126.318.035.038", "929.398.951.889", "722.247.931.582", "646.865.545.408", "543.910.244.929"], 
        "/contact"=>["184.123.665.067", "184.123.665.067"], 
        "/home"=>["184.123.665.067", "235.313.352.950", "316.433.849.805"], 
        "/about/2"=>["444.701.448.104"], 
        "/index"=>["444.701.448.104"], 
        "/about"=>["061.945.150.735"]
      }
    end

    it "data parsing" do
      expect(subject.parse).to eq(expected_response)
    end
  end

  describe '#most_views' do
    before { subject.parse }

    let(:expected_response) do
      {"/help_page/1"=>5, "/contact"=>2, "/home"=>3, "/about/2"=>1, "/index"=>1, "/about"=>1}
    end

    it 'returns the correct values' do
      expect(subject.most_views).to eq(expected_response)
    end
  end

  describe '#unique_views' do
    before { subject.parse }

    let(:expected_response) do
      {"/help_page/1"=>5, "/contact"=>1, "/home"=>3, "/about/2"=>1, "/index"=>1, "/about"=>1}
    end

    it 'returns the correct values' do
      expect(subject.unique_views).to eq(expected_response)
    end
  end
end
