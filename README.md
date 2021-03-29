# SharePoint Site Script and Design Update
This PowerShell script demonstrates some simple handling of updating SharePoint site scripts and site designs. With this script (adjusted to your needs), it is much easier to simply update the site script file, then run the PowerShell script again.

You should review the whole code and understand what it is doing, but here are some hints of what you would need to change to prepare it for your own scenario:
1. Update the tenant domain
2. Update the title and description of the site script and design
3. If this design is for communication sites instead of team sites, change the WebTemplate option on the site design to 68 instead of 64

## Next Update
My goal for the next update is to add some further demonstrations of more complicated scenarios like if you have a site design that incorporates multiple scripts, e.g.:
ProjectType1 uses scripts Project + script Project1
ProjectType2 uses scripts Project + script Project2