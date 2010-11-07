package api.printer.printText
{
	import flash.events.IEventDispatcher;
	import api.printer.Printer;
	
	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class PrintText extends Printer
	{
		// Required
		public var text:String = null;
		
		public function PrintText(target:IEventDispatcher=null)
		{
			super(target);
		}
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