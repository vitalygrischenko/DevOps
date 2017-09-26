unless os.windows?
  
  describe user('vagrant'), :skip do
    it { should exist }
    it { should have_home_directory '/home/vagrant' }
  end
end
describe docker.version do
  its('Server.Version') { should cmp >= '1.10'}
  its('Client.Version') { should cmp >= '1.10'}
end
