shared_examples "File Generator" do |klass|
  it "write_to_file overriden" do
    expect(is_overridden?(klass.method(:write_to_file))).to be true
  end

  it "file_type overriden" do
    expect(is_overridden?(klass.method(:file_type))).to be true
  end
end

def is_overridden?(method)
  name = method.name.to_sym
  return false if !method.owner.superclass.method_defined?(name)
  method.owner != method.owner.superclass.instance_method(name).owner
end
