describe "Resume Generator" do
  let(:user_interface) { UserInterface.new }
  let(:file_formatter) { FileFormatter.new }
  let(:resume_gen) { ResumeGen.new([:Name, :age]) }
  
  describe "#initialize" do
    it "initializes resume generator" do
      data = [:Name, :age]
      resume_gen_test = ResumeGen.new(data)
      expect(resume_gen_test.instance_variable_get(:@fields)).to eq(data)
      expect(resume_gen_test.instance_variable_get(:@user_interface)).to be_an_instance_of(UserInterface)
      expect(resume_gen_test.instance_variable_get(:@file_formatter)).to be_an_instance_of(FileFormatter)
    end
  end
  
  describe "#input_data" do
    it "gets data from user" do
      expect_any_instance_of(UserInterface).to receive(:welcome).once
      expect_any_instance_of(UserInterface).to receive(:get_data).with([:Name, :age]).once
      resume_gen.input_data
    end
  end
  
  describe "#user_choice" do
    it "prints available choices and asks user to enter a choice" do
      list = double(Array)
      expect_any_instance_of(FileFormatter).to receive(:get_formats).once.and_return(list)
      expect_any_instance_of(UserInterface).to receive(:display_list).with(list).once
      expect_any_instance_of(UserInterface).to receive(:get_choice).once
      resume_gen.user_choice
    end
  end

  describe "#print_file" do
    it "prints available choices and asks user to enter a choice" do
      data = double(Hash)
      choice = double(Fixnum)
      path = double(String)
      allow(resume_gen).to receive(:input_data).and_return(data)
      allow(resume_gen).to receive(:user_choice).and_return(choice)
      expect_any_instance_of(FileFormatter).to receive(:output_file).with(data, choice).once.and_return(path)
      expect_any_instance_of(UserInterface).to receive(:display_filepath).once.with(path)
      resume_gen.print_file(resume_gen.input_data, resume_gen.user_choice)
    end
  end
end
