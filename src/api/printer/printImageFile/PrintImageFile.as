package api.printer.printImageFile
{
	import api.events.printer.printImageFile.PrintImageFileEvent;

	import api.printer.Printer;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Send an external image file to the selected printer.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_printImageFile.html Northcode Help Documentation
	*/
	public class PrintImageFile extends Printer
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var center:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var fitToPage:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var stretchToFit:Boolean = false;
		
		// Required
		/**
		* Fully qualified path to an image to be printed. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for Printer.PrintImageFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_printImageFile.html Northcode Help Documentation
		*/
		public function PrintImageFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Send an external image file to the selected printer.
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_printImageFile.html Northcode Help Documentation
		*/
		public function printImageFile( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Printer.printImageFile( {path:path , center:center , fitToPage:fitToPage , stretchToFit:stretchToFit}
												  ,{callback:actionComplete, errorSTR:"printImageFileError", code:"32003"} );
			}
		}
	}
}