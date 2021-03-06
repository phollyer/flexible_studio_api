package api.keyboard.sendPress
{
	import api.events.keyboard.sendPress.SendPressEvent;

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
	* Simulate the pressing of a key (see also: Keyboard.sendRelease)
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_sendPress.html Northcode Help Documentation
	*/
	public class SendPress extends Keyboard
	{
		// Required
		/**
		* The Windows virutal key code to be sent.
		*
		* @defaultValue <code>null</code>
		*/
		public var key:String = null;
		/**
		* Handle of window where the key should be sent. If the hwnd is 0, the key will be sent to the window that has the input focus. If the hwnd is not 0, the specified window will become the foreground window before the key is sent.
		*
		* @defaultValue <code>null</code>
		*/
		public var hwnd:String = null;
		
		/**
		* Constructor for Keyboard.SendPress()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_sendPress.html Northcode Help Documentation
		*/
		public function SendPress(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Simulate the pressing of a key (see also: Keyboard.sendRelease)
		*
		*
		* @param keySTR
		*
		* @param hwndSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_sendPress.html Northcode Help Documentation
		*/
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