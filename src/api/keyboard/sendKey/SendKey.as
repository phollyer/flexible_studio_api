package api.keyboard.sendKey
{
	import api.events.keyboard.sendKey.SendKeyEvent;

	import api.keyboard.Keyboard;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>key</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_KEY
	*/
	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	[Event(name="missingHwnd" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_sendKey.html Northcode Help Documentation
	*/
	public class SendKey extends Keyboard
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var key:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var hwnd:String = null;
		
		/**
		* Constructor for Keyboard.SendKey()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_sendKey.html Northcode Help Documentation
		*/
		public function SendKey(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param keySTR
		*
		* @param hwndSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_sendKey.html Northcode Help Documentation
		*/
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