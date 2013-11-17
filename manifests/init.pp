# Public: Install fish into Homebrew, add to /etc/shells and by default change
# the user's shell to it.
#
# Examples
#
#   # Install and set as default shell
#   include fish
#
#   # Install, but without setting default shell
#   class { 'fish':
#     chsh => false,
#   }
class fish (
  $chsh = true,
) {
  require boxen::config

  package { 'fish': }

  file_line { 'add fish to /etc/shells':
    path    => '/etc/shells',
    line    => "${boxen::config::homebrewdir}/bin/fish",
    require => Package['fish'],
  }

  if $chsh {
    osx_chsh { $::luser:
      shell   => "${boxen::config::homebrewdir}/bin/fish",
      require => File_line['add fish to /etc/shells'],
    }
  }

  file { "${boxen::config::home}/env.fish":
    content => template('fish/env.fish.erb'),
    mode    => '0755',
  }
}
