package api.keyboard.sendString
{
	import api.events.keyboard.sendString.SendStringEvent;

	import api.keyboard.Keyboard;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>text</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_TEXT
	*/
	[Event(name="missingText" , type="api.events.SWFStudioEvent")]
	[Event(name="missingHwnd" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Send keyboard messages to another window to make it believe the string is actually being typed at the keyboard.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_sendString.html Northcode Help Documentation
	*/
	public class SendString extends Keyboard
	{
		// Required
		/**
		* Handle of window where the string should be sent. If the hwnd is 0, the string will be sent to the window that has the input focus. If the hwnd is not 0, the specified window will become the foreground window before the string is sent.
		*
		* @defaultValue <code>null</code>
		*/
		public var hwnd:String = null;
		/**
		* A string to be sent. SWF Studio will figure out which virtual key codes are required to send the correct string.
		*
		* @defaultValue <code>null</code>
		*/
		public var text:String = null;
		
		/**
		* Constructor for Keyboard.SendString()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_sendString.html Northcode Help Documentation
		*/
		public function SendString(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Send keyboard messages to another window to make it believe the string is actually being typed at the keyboard.
		*
		*
		* @param textSTR
		*
		* @param hwndSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_sendString.html Northcode Help Documentation
		*/
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