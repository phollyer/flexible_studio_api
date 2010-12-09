package api.win.sendMessage
{
	import api.events.win.sendMessage.SendMessageEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>message</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_MESSAGE
	*/
	[Event(name="missingMessage" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Send an action message to a target window identified by a window handle (hwnd) or group of windows identified by a partial caption.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_sendMessage.html Northcode Help Documentation
	*/
	public class SendMessage extends Win
	{
		// Optional
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
		public var target:String = null;
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var message:String = null;
		
		/**
		* Constructor for Win.SendMessage()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_sendMessage.html Northcode Help Documentation
		*/
		public function SendMessage(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Send an action message to a target window identified by a window handle (hwnd) or group of windows identified by a partial caption.
		*
		*
		* @param winMessage
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_sendMessage.html Northcode Help Documentation
		*/
		public function sendMessage( winMessage:String = null ):void
		{
			message = compareStrings( winMessage , message );
			
			switch( message )
			{
				case null:
					missingMessage();
					break;
				default:
					var __o:Object = new Object();
					__o.message = message;
					switch( hwnd != null )
					{
						case true:
							__o.hwnd = hwnd;
					}
					switch( target != null )
					{
						case true:
							__o.target = target;
					}
					ssCore.Win.sendMessage( __o
										  ,{callback:actionComplete, errorSTR:"sendMessageError", code:"6016"} );
			}
		}
	}
}