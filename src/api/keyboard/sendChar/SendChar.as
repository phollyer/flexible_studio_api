package api.keyboard.sendChar
{
	import api.events.keyboard.sendChar.SendCharEvent;

	import api.keyboard.Keyboard;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>char</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_CHAR
	*/
	[Event(name="missingChar" , type="api.events.SWFStudioEvent")]
	[Event(name="missingHwnd" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Simulate press and release of keys necessary to 'type' the specified character.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_sendChar.html Northcode Help Documentation
	*/
	public class SendChar extends Keyboard
	{
		// Required
		/**
		* A single character to be sent. Note that 'A' is different from 'a', SWF Studio will figure out which virtual key codes are required to send the correct character.
		*
		* @defaultValue <code>null</code>
		*/
		public var char:String = null;
		/**
		* Handle of window where the character should be sent. If the hwnd is 0, the character will be sent to the window that has the input focus. If the hwnd is not 0, the specified window will become the foreground window before the character is sent.
		*
		* @defaultValue <code>null</code>
		*/
		public var hwnd:String = null;
		
		/**
		* Constructor for Keyboard.SendChar()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_sendChar.html Northcode Help Documentation
		*/
		public function SendChar(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Simulate press and release of keys necessary to 'type' the specified character.
		*
		*
		* @param charSTR
		*
		* @param hwndSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_sendChar.html Northcode Help Documentation
		*/
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