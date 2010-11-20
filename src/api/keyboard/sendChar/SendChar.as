package api.keyboard.sendChar
{
	import flash.events.IEventDispatcher;
	import api.keyboard.Keyboard;

	[Event(name="missingChar" , type="api.events.SWFStudioEvent")]
	[Event(name="missingHwnd" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SendChar extends Keyboard
	{
		// Required
		public var char:String = null;
		public var hwnd:String = null;
		
		public function SendChar(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function sendChar( charSTR:String = null , hwndSTR:String = null ):void
		{
			char = compareStrings( charSTR , char );
			hwnd = compareStrings( hwndSTR , hwnd );
			
			switch( char )
			{
				case null:
					missingChar();
					break;
				default:
					switch( hwnd )
					{
						case null:
							missingHwnd();
							break;
						default:
							ssCore.Keyboard.sendChar( {char:char , hwnd:hwnd}
													 ,{callback:actionComplete, errorSTR:"sendCharError", code:"25002"} );
					}
			}
		}

	}
}