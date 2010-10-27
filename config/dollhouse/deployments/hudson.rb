deployment :hudson do
  server "hudson" do
    
    task 'setup' do
      bootstrap
      
      babushka 'quamen:user set up from root',
               :username            => 'hudson',
               :password            => Auth::SERVER_PASSWORD,
               :your_ssh_public_key => File.read(Auth::KEYPAIR + '.pub')
      
      as "hudson", :password => Auth::SERVER_PASSWORD do
        babushka 'quamen:hudson'
        babushka 'quamen:hudson plugins for rails'
      end
    end
    
  end
end