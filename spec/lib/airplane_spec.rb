require_relative "../../lib/airplane"

describe Airplane do
  let(:my_plane) { Airplane.new("cesna", 10, 150, 100) }

  describe "#initialization" do
    it 'it returns type of plane' do
      expect(my_plane.type).to eq ("cesna")
    end

    it 'it returns value of wing loading' do
      expect(my_plane.wing_loading).to eq (10)
    end

    it 'it returns value of horsepower' do
      expect(my_plane.horsepower).to eq (150)
    end
  end

  ######################################################################################
  ######################################################################################


  describe "#land" do
    let(:new_plane) { Airplane.new("cesna", 10, 150, 100) }

    context 'if plane is not started' do
      it 'should start' do
        expect(new_plane.land).to eq ('airplane not started, please start')
      end
    end

    context 'if plane has started' do
      it 'should takeoff' do
        new_plane.start
        expect(new_plane.land).to eq ('airplane already on the ground')
      end
    end

    context 'if plane is in the air' do
      it ' and has enough gas it should land' do
        new_plane.start
        new_plane.takeoff
        expect(new_plane.land).to eq ('airplane landed')
      end

      it ' and has aint enough gas it is fucked' do
        new_plane.start
        new_plane.takeoff
        new_plane.fuel = 5
        expect(new_plane.land).to eq ('yall is done for')
      end

    end
  end

  ######################################################################################
  ######################################################################################


  describe "#takeoff" do
    let(:my_plane) { Airplane.new("cesna", 10, 150, 100) }
    context 'if plane is not started' do
      it 'it should not takeoff' do
        expect(my_plane.takeoff).to eq ('airplane not started, please start')
      end
    end

    context 'if plane already started' do
      it 'if not flying, then should takeoff if has enough gas' do
        my_plane.start
        expect(my_plane.takeoff).to eq ('airplane launched')
      end

      it 'if not flying and has no gas, do not take off' do
        my_plane.start
        my_plane.fuel = 10
        expect(my_plane.takeoff).to eq ('not enough gas for liftoff')
      end
    end
  end

  ######################################################################################
  ######################################################################################


  describe "#start" do
   let(:my_plane) { Airplane.new("cesna", 10, 150, 100) }


    context 'when the plane is not started and has enough gas' do
      it 'should start' do
        expect(my_plane.start).to eq ('airplane started')
      end
    end

    context 'when the plane is not started and does not have enough gas' do

      it 'should not start' do
        my_plane.method_off
        my_plane.fuel = 5
        expect(my_plane.start).to eq ('not enough gas')
      end
    end

    context 'when the plane has already started' do
      it 'shouldn\t start again' do
        my_plane.fuel = 100
        my_plane.start
        expect(my_plane.start).to eq ('airplane already started')
      end
    end
  end
end


