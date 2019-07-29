require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }
  #it { is_expected.to respond_to(:weather) }
  it 'has a hangar capacity' do
    expect(subject.hangar).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#initialize' do

    it "creates a new airport" do
      expect(Airport.new).to be_a(Airport)
    end

  end
  
  describe '#land' do

    it 'lands a plane' do
      plane = double("plane", :flying? => true)
      subject.land(plane)
      expect(subject.planes.last).to eq plane
    end

    it "only lands things that are currently flying" do
      plane = double("plane", :flying? => false)
      expect{ subject.land(plane) }.to raise_error "Can't land this, it's not flying"
    end

    it 'raises an error when airport full' do
      subject.hangar.times { subject.land(Plane.new) }
      expect { subject.land Plane.new }.to raise_error 'Airport is full'
    end

  end
  
  describe '#take_off' do

    it 'makes a plane take off' do
      plane = Plane.new
      subject.land(plane)
      # a plane is taking off
      expect(subject.take_off).to eq plane
    end

    it "raises an error when airport is empty" do
      expect { subject.take_off }.to raise_error "No planes, can't take off"
    end

  end

end