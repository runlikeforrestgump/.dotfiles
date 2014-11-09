.dotfiles
=========

Personal configuration files.

TODO: Document what I use.

mutt
====

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
