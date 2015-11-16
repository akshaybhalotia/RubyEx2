describe "Resume Generator" do
  let(:user_interface) { UserInterface.new }
  let(:file_formatter) { FileFormatter.new }
  let(:resume_gen) { ResumeGen.new([:name, :age]) }
  
  describe "#initialize" do
    it "initializes resume generator" do
      data = [:name, :age]
      resume_gen_test = ResumeGen.new(data)
      expect(resume_gen_test.instance_variable_get(:@fields)).to eq(data)
      expect(resume_gen_test.instance_variable_get(:@user_interface)).to be_an_instance_of(UserInterface)
      expect(resume_gen_test.instance_variable_get(:@file_formatter)).to be_an_instance_of(FileFormatter)
    end
  end

  describe "#print_welcome" do
    it "prints welcome message" do
      expect_any_instance_of(UserInterface).to receive(:welcome).once
      resume_gen.print_welcome
    end
  end
  
  describe "#input_data" do
    it "asks user for data" do
      expect_any_instance_of(UserInterface).to receive(:get_data).with([:name, :age]).once
      resume_gen.input_data
    end
  end

  describe "#fetch_list" do
    it "fetches list of available choices" do
      expect_any_instance_of(FileFormatter).to receive(:get_formats).once
      resume_gen.fetch_list
    end
  end
  
  describe "#user_choice" do
    it "prints available choices" do
      list = instance_double(Array, :size => 2, :each_with_index => ['b', 2])
      allow(resume_gen).to receive(:fetch_list).once.and_return(list)
      expect_any_instance_of(UserInterface).to receive(:display_list).with(list).once
      resume_gen.user_choice
    end

    it "asks user to enter a choice" do
      expect_any_instance_of(UserInterface).to receive(:get_choice).once
      resume_gen.user_choice
    end
  end

  describe "#print_file" do
    it "prints file in selected format" do
      data = double(Hash)
      choice = double(Integer)
      path = double(String)
      allow(resume_gen).to receive(:input_data).and_return(data)
      allow(resume_gen).to receive(:user_choice).and_return(choice)
      expect_any_instance_of(FileFormatter).to receive(:output_file).with(data, choice).once.and_return(path)
      resume_gen.print_file(resume_gen.input_data, resume_gen.user_choice)
    end
  end

  describe "#display_file_path" do
    it "displays path of printed file" do
      data = double(Hash)
      choice = double(Integer)
      path = double(String)
      allow(resume_gen).to receive(:input_data).and_return(data)
      allow(resume_gen).to receive(:user_choice).and_return(choice)
      allow(resume_gen).to receive(:print_file).with(data, choice).and_return( path)
      expect_any_instance_of(UserInterface).to receive(:display_filepath).once.with(path).once
      resume_gen.display_file_path
    end
  end
end
