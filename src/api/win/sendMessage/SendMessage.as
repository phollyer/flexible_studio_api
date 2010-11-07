package api.win.sendMessage
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Event(name="missingMessage" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SendMessage extends Win
	{
		// Optional
		public var hwnd:String = null;
		public var target:String = null;
		
		// Required
		public var message:String = null;
		
		public function SendMessage(target:IEventDispatcher=null)
		{
			super(target);
		}
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