Menus = The user interface that the client interacts with.

Handlers = Processes that call functions and return data to the client.
    - screens: Processes that are used to manage the screen sessions. Each screen session can have a list of windows,

    - windows: Processes that are used to manage the windows within a screen session. Each window serves as a terminal/console for a server.

    - servers: Processes that are called to start, stop, or check the status of the servers.

    - timed: Processes that are called at a set interval. The two current handlers are:
        -   Boot-Start: Process that is called on boot to immediately put up the preset servers.
        -   Hourly-Check: Process that calls check functions every hour to ensure the server is up.

    - error: I've put end points for error handling, if you see any errors output to you, the log handler will automatically server it to /log/error.log. Please let me know if you see any errors as these are coded in end points that should not be reached.

    - logs: handles all the logs regarding errors and server status.
        - error: handles all the error logs.
        - status: handles all the status logs.
        - server: handles all the server logs.

    - format: handles all the formatting for the server manager.

Functions = Instructions to physically perform a task, this layer is where all the execution is done.

The hiearchy of functioning is as follows:
    - Menus -> Handlers -> Functions
    (Menus call the Handlers, The Handlers Call the Functions, The Functions Serve the Handlers which then Returns the information back to the Menu)

The hiearchy of Server Structure is as follows:
    - Screen -> Window -> Server
    
    - Screens are sessions which contains windows
        - Windows serves a new command-line terminal for servers
            - Server is the console for the servers
```