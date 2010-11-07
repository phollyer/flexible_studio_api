package api.keyboard.sendPress
{
	import flash.events.IEventDispatcher;
	import api.keyboard.Keyboard;

	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	[Event(name="missingHwnd" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SendPress extends Keyboard
	{
		// Required
		public var key:String = null;
		public var hwnd:String = null;
		
		public function SendPress(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function sendPress( keySTR:String = null , hwndSTR:String = null ):void
		{
			key = compareStrings( keySTR , key );
			hwnd = compareStrings( hwndSTR , hwnd );
			
			switch( key )
			{
				case null:
					missingKey();
					break;
				default:
					switch( hwnd )
					{
						case null:
							missingHwnd();
							break;
						default:
							ssCore.Keyboard.sendPress( {key:key , hwnd:hwnd}
													 ,{callback:actionComplete, errorSTR:"sendPressError", code:"25004"} );
					}
			}
		}

	}
}