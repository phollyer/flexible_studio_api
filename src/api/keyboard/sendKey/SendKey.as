package api.keyboard.sendKey
{
	import flash.events.IEventDispatcher;
	import api.keyboard.Keyboard;

	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	[Event(name="missingHwnd" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SendKey extends Keyboard
	{
		// Required
		public var key:String = null;
		public var hwnd:String = null;
		
		public function SendKey(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function sendKey( keySTR:String = null , hwndSTR:String = null ):void
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
							ssCore.Keyboard.sendKey( {key:key , hwnd:hwnd}
													,{callback:actionComplete, errorSTR:"sendKeyError", code:"25003"} );
					}
			}
		}

	}
}