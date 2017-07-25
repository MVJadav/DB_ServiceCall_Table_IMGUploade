1. Add libsqlite3 file :  [command"+shift+G]
Go to Build Phases > Link Binary with Libraries > + > Add other
While in the file selection window press: "command"+shift+G (i.e. Go to folder) and type /usr/lib/
From /user/lib find and add : libz.dylib and libsqlite3.dylib
2. Create Bridge : Build Setting
3. In Plist File:  App Transport Security Settings -> Allow Arbitrary Loads
4. In Plist :For Photos
* Privacy - Camera Usage Description
* Privacy - Photo Library Usage Description
