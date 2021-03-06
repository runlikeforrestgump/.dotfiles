.dotfiles
=========

Personal configuration files.

What I Use
==========

* [cmus](https://cmus.github.io/): a music player.
* [colordiff](http://www.colordiff.org/): adds colour to diffs.
* [Dina Programming Font](https://www.donationcoder.com/Software/Jibz/Dina/): a monospace bitmap font.
* [dmenu](http://tools.suckless.org/dmenu/): a dynamic menu.
* [dunst](http://knopwob.org/dunst/index.html): a desktop notification daemon.
* [dwm](http://dwm.suckless.org/): a dynamic window manager.
* [feh](http://feh.finalrewind.org/): an image viewer.
* [GNU GRUB](https://www.gnu.org/software/grub/): a boot loader.
* [GNU Screen](https://www.gnu.org/software/screen/): a terminal multiplexer.
* [GNU Unifont](http://unifoundry.com/unifont.html): a Unicode bitmap font.
* [GNU Units](https://www.gnu.org/software/units/): a unit converter.
* [HexChat](https://hexchat.github.io/): an IRC client.
* [Hunspell](http://hunspell.sourceforge.net/): a spell checker.
* [Mozilla Firefox](https://www.mozilla.org/en-GB/firefox/new/): a Web browser.
* [MuPDF](http://mupdf.com/): a PDF viewer.
* [mutt](http://www.mutt.org/): an email client.
* [rxvt-unicode](http://software.schmorp.de/pkg/rxvt-unicode.html) (aka urxvt): a terminal emulator.
* [scrot](http://linuxbrit.co.uk/scrot/): for taking screenshots.
* [SMPlayer](http://smplayer.sourceforge.net/): a media player.
* [The Silver Searcher](http://geoff.greer.fm/ag/): a fast grep-like tool optimised for programmers.
* [urxvt-perls](https://github.com/muennich/urxvt-perls): urxvt extensions.
* [Vim](http://www.vim.org/): a text editor.
* [XScreenSaver](http://www.jwz.org/xscreensaver/): screen savers and screen locking.
* [Zsh](http://www.zsh.org/): a shell.

mutt
====

What I use:
* [lbdb](https://www.spinnaker.de/lbdb/): for querying LDAP for email addresses.
* [Msmtp](http://msmtp.sourceforge.net/): an SMTP client.
* [mutt-sidebar](http://www.lunar-linux.org/mutt-sidebar/): for showing a list of mail folders.
* [notmuch](http://notmuchmail.org/): a mail indexer and searcher.
* [OfflineIMAP](http://offlineimap.org/): a mail retriever.
* [remind](http://www.roaringpenguin.com/products/remind): a calendar and alarm.
* [Wyrd](http://pessimization.com/software/wyrd/): a calendar viewer (a front-end to remind).

Office365 Meeting Invitations Setup
-----------------------------------

If meeting invitations from Office365 show up as links to Outlook Web Access (OWA) instead of iCalendar (text/calendar) attachments, then do the following on a Windows machine:

1. Download and install Microsoft .NET Framework 4.5 from http://www.microsoft.com/en-us/download/details.aspx?id=30653.
1. Download and install Windows Management Framework 4.0 (Windows6.1-KB2819745-x64-MultiPkg.msu) from http://www.microsoft.com/en-us/download/details.aspx?id=40855.
1. Run PowerShell as an administrator.
1. `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned`
1. `$UserCredential = Get-Credential`
    * Enter your email address and password.
1. `$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection`
1. `$ImportResults = Import-PSSession $Session`
1. `Get-CASMailbox -identity YOUR@EMAIL.ADDRESS | Format-List`
1. `Set-CASMailbox -identity YOUR@EMAIL.ADDRESS -PopUseProtocolDefaults:$FALSE -ImapUseProtocolDefaults:$FALSE -PopForceICalForCalendarRetrievalOption:$TRUE -ImapForceICalForCalendarRetrievalOption:$TRUE`
1. `Remove-PSSession $Session`
1. `Set-ExecutionPolicy -ExecutionPolicy Restricted`

vim
===

I'd like Vim to be a powerful IDE for C, C++, CSS, HTML, Java, JavaScript, JSON, Markdown, Perl, Python, Ruby, Scala, XML, etc. I've been using Vim for years for all my text editing needs, but I'm far from having a setup that suits all my needs. Sure, if all I did was Python development, then there's lots of plugins out there to make Vim a great Python IDE; however, I don't just do Python.

I did try switching from Vim to Emacs for all my text editing needs a few years ago; however, I think that was a bad idea. My biggest complaint was that Emacs was slow to load. I love Vim because I can quickly open, edit, and close a file. I assume the problem was me, not Emacs. I assume that I should treat Emacs like I would treat any IDE: I shouldn't expect to use an IDE as something that I open and close frequently. If I can't turn Vim into an ultimate IDE, then I plan to use Emacs as an IDE (and treat it as such) and use Vim for quickly editing files (and maybe even use it as an IDE for some languages).

What I want in an IDE:
* Automatically add headers for things that are used in the file.
* Code completion that shows docs for possible completions, so that I can make an informed choice.
* Code generation for typical things such as getters and setters.
* Code searching.
* Comment templates that are automatically inserted when I start typing a comment before a function or class.
* Debugger.
* File explorer.
* Fuzzy file opening.
* Highlight unused headers and provide an option to delete them.
* Jump to declaration.
* Jump to definition.
* Powerful refactoring tools (mainly renaming and moving, and deleting whole things, such as classes, functions, structs).
* Provide a way to show the documentation for a given function/class/whatever.
* Quickly comment or uncomment any arbitrary set of lines.
* Remove trailing whitespace.
* Run tests.
* See what uses a function (show a list of call sites).
* Show SCM blame data for each line.
* Show what lines have been added, modified, or removed.
* Style checking.
* Syntax checking.
* Syntax highlighting.
* And other things that would make me more productive.

What I use:
* [commentary](https://github.com/tpope/vim-commentary): for commenting and uncommenting code.
* [cscope](http://cscope.sourceforge.net/): a C code navigation tool.
* [ctrlp](https://kien.github.io/ctrlp.vim/): a fuzzy file searcher.
* [EasyMotion](https://github.com/Lokaltog/vim-easymotion): for jumping around a file quickly.
* [fugitive](https://github.com/tpope/vim-fugitive): a Git wrapper.
* [gitgutter](https://github.com/airblade/vim-gitgutter): for showing what lines have been added, modified, or removed.
* [pathogen](https://github.com/tpope/vim-pathogen): makes it super easy to install Vim plugins.
* [syntastic](https://github.com/scrooloose/syntastic): a syntax checker.
* [xoria256](http://www.vim.org/scripts/script.php?script_id=2140): a colour scheme.
