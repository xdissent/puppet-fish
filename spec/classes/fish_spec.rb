require 'spec_helper'
describe 'fish' do
  let(:facts) do 
    {
      :luser      => 'dgoodlad',
      :boxen_home => '/opt/boxen'
    }
  end

  it do
    should contain_package('fish')

    should contain_file_line('add fish to /etc/shells').with({
      :path    => '/etc/shells',
      :line    => "#{facts[:boxen_home]}/homebrew/bin/fish",
      :require => 'Package[fish]'
    })

    should contain_osx_chsh('dgoodlad').with({
      :shell   => "#{facts[:boxen_home]}/homebrew/bin/fish",
      :require => 'File_line[add fish to /etc/shells]'
    })
  end

  context "without changing default shell" do
    let(:params) { {:chsh => false} }

    it do
      should_not contain_osx_chsh('dgoodlad')
    end
  end
end
