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
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_sendString.html Northcode Help Documentation
	*/
	public class SendString extends Keyboard
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var hwnd:String = null;
		/**
		* 
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
		*
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