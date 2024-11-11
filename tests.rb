require_relative "./index.rb"

RSpec.describe "word counter" do
  let(:file_path) { "test.txt" }

  before do
    File.open(file_path, "w") do |file|
      file.puts "hello world! test? test. hello, World"
    end
  end

  after do
    File.delete(file_path) if File.exist?(file_path)
  end

  it "returns correct word frequencies" do
    expect(
      get_frequencies(file_path))
        .to eq({
          "hello" => 2,
          "world" => 2,
          "test" => 2
        })
  end

  it "returns an empty hash for an empty file" do
    File.write(file_path, "")
    expect(get_frequencies(file_path)).to eq({})
  end
end