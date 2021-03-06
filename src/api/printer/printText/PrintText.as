package api.printer.printText
{
	import api.events.printer.printText.PrintTextEvent;

	import api.printer.Printer;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>text</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_TEXT
	*/
	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Sends a string of text to the selected printer.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_printText.html Northcode Help Documentation
	*/
	public class PrintText extends Printer
	{
		// Required
		/**
		* Text to be printed using the current settings for the selected printer.
		*
		* @defaultValue <code>null</code>
		*/
		public var text:String = null;
		
		/**
		* Constructor for Printer.PrintText()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_printText.html Northcode Help Documentation
		*/
		public function PrintText(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Sends a string of text to the selected printer.
		*
		*
		* @param textSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_printText.html Northcode Help Documentation
		*/
		public function printText( textSTR:String = null ):void
		{
			text = compareStrings( textSTR , text );
			
			switch( text )
			{
				case null:
					missingText();
					break;
				default:
					ssCore.Printer.printText( {text:text}
											 ,{callback:actionComplete, errorSTR:"printTextError", code:"32004"} );
			}
		}
	}
}