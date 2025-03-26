(*
Copyright (C) 2023 - 2025  Gregor Gottschewski

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*)
--
--  AppDelegate.applescript
--  Sleepo(-NoMacLidSleep)
--
--  Created by Gregor Gottschewski on 22.02.21.
--
--

script AppDelegate
    property pathToResources : "NSString"
    property parent : class "NSObject, NSWindow, NSAppleEventsUsageDescription"
    
    property toggleProperty : false
    
    global disablesleep
    
    on applicationWillFinishLaunching_(aNotification)
        -- path to resources needed to run the script
        set pathToResources to (current application's class "NSBundle"'s mainBundle()'s resourcePath()) as string
        -- set the toggle
        set my toggleProperty to getStatus()
    end applicationWillFinishLaunching_
    
    on applicationShouldTerminate_(sender)
        return current application's NSTerminateNow
    end applicationShouldTerminate_
    
    on toggleMode_(sender)
        if (toggleProperty as boolean) is false then
            deactivate_(sender)
        else
            activate_(sender)
        end if
    end toggleMode_
    
    on terminateAndQuit_(sender)
        -- no clean needed and terminate
    end terminateAndQuit_
    
    on activate_(sender)
        try
            do shell script "sudo pmset -b disablesleep 1" with administrator privileges
            set my toggleProperty to true
            display notification "Sleepo is activated. Please make sure your Mac can cool."
        on error
            -- catch user canceled
            set my toggleProperty to false
        end try
    end activate_

    on deactivate_(sender)
        try
            do shell script "sudo pmset -b disablesleep 0" with administrator privileges
            set my toggleProperty to false
        on error
            -- catch user canceled
            set my toggleProperty to true
        end try
    end deactivate_
    
    on getStatus()
        set script_file to pathToResources & "/script.sh"
        return(do shell script script_file)
    end getStatus
    
end script
