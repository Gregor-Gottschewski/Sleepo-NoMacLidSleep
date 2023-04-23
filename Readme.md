# Sleepo - NoMacLidSleep for MacBooks
![Header image](images/sleepo.png)
## The problem and the solution
I am using my MacBook with an external monitor. While it is connected I do
not need the inbuild monitor, it is just deflecting. So I close the lid. The
problem is that you cannot do that when the Mac is not connected to power
because the external monitor immediately turns off. So I developed this small AppleScript
based application which tells the MacBook to do not go into standby.

## Important disclaimer
Be aware that this tool is quite powerfull. **It overrides system values**.
You need to know that, if the tool is activated, your Mac cannot go into
standby. So if you put your Mac in a closed bag **it cannot cool**. This
**can cause overheating or other demage**. **So please make sure the Mac can
cool**!

> THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM “AS IS” WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

## How is it working?
The technique behind Sleepo is quite simple: It manipulates the power management settings (`pmset`). For this it needs superuser (sudo)/administrator privileges.

### User interface

> Currently no download is available. Just clone this repo and export Sleepo
in Xcode.

The user interface is the easiest way to manipulate `pmset`. Just start Sleepo
and (de)activate it with the switch. That's it!

![User interface example GIF](images/example-video.gif)

### Terminal commands
> You use the commands at your own risk!

If you do not want do download Sleepo, you can directly manipulate `pmset`. If
you want to stop your Mac to go into sleep when the lid is closed open up your `Terminal` and enter the following command:

> sudo pmset displaysleep 0

To reset `pmset` to its defaults just change the `0` to a `1`.

That's it! If you want to display the current settings type:

> sudo pmset -g

## Compatible MacBooks
Sleepo works on:
* MacBook Pro 2012 / Intel / macOS Catalina 10.15
* MacBook Air 2020 / Intel / macOS Ventura 13

You are welcome to extend this list.

