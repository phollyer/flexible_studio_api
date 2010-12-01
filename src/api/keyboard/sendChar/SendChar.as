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
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_sendChar.html Northcode Help Documentation
	*/
	public class SendChar extends Keyboard
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var char:String = null;
		/**
		* 
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
		*
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