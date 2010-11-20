package api.keyboard.sendString
{
	import flash.events.IEventDispatcher;
	import api.keyboard.Keyboard;

	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Event(name="missingHwnd" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SendString extends Keyboard
	{
		// Required
		public var hwnd:String = null;
		public var text:String = null;
		
		public function SendString(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function sendString( textSTR:String = null , hwndSTR:String = null ):void
		{
			text = compareStrings( textSTR , text );
			hwnd = compareStrings( hwndSTR , hwnd );
			
			switch( text )
			{
				case null:
					missingText();
					break;
				default:
					switch( hwnd )
					{
						case null:
							missingHwnd();
							break;
						default:
							ssCore.Keyboard.sendString( {text:text , hwnd:hwnd}
													 ,{callback:actionComplete, errorSTR:"sendStringError", code:"25006"} );
					}
			}
		}

	}
}