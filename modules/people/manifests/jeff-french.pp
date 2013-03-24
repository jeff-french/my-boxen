class people::jeff-french {
  include iterm2::dev
  include skype
  include hipchat
  include chrome
  include sublime_text_2
  include wunderlist
  include spoitify
  include dropbox

  $home     = "/Users/${::luser}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"

  repository { $dotfiles:
    source  => 'jeff-french/dotfiles',
    require => File[$my]
  }

  file { "${home}/.bash_colors":
  	ensure => link,
  	target => "${dotfiles}/.bash_colors",
  	require => Repository[$dotfiles]
  }

  file { "${home}/.bash_profile":
  	ensure => link,
  	target => "${dotfiles}/.bash_profile",
  	require => Repository[$dotfiles]
  }
}