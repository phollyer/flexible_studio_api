package api.printer.printImageFile
{
	import flash.events.IEventDispatcher;
	import api.printer.Printer;
	
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class PrintImageFile extends Printer
	{
		// Optional
		public var center:Boolean = false;
		public var fitToPage:Boolean = false;
		public var stretchToFit:Boolean = false;
		
		// Required
		public var path:String = null;
		
		public function PrintImageFile(target:IEventDispatcher=null)
		{
			super(target);
		}
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