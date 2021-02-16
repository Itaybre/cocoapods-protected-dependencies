require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Private do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ private }).should.be.instance_of Command::Private
      end
    end
  end
end

