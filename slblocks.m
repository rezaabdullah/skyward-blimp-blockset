function blkStruct = slblocks
		% This function specifies that the library should appear
		% in the Library Browser
		% and be cached in the browser repository

		Browser.Library = 'SkywardBLIMP';
		% 'mylib' is the name of the library

		Browser.Name = 'Skyward BLIMP Blockset';
		% 'My Library' is the library name that appears in the Library Browser

		blkStruct.Browser = Browser;