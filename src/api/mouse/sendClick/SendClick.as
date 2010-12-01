package api.mouse.sendClick
{
	import api.events.mouse.sendClick.SendClickEvent;

	import api.mouse.Mouse;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>button</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_BUTTON
	*/
	[Event(name="missingButton" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_sendClick.html Northcode Help Documentation
	*/
	public class SendClick extends Mouse
	{
		public static const LEFT:String = "left";
		public static const MIDDLE:String = "middle";
		public static const RIGHT:String = "right";
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var button:String = null;
		
		/**
		* Constructor for Mouse.SendClick()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_sendClick.html Northcode Help Documentation
		*/
		public function SendClick(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param mouseButton
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_sendClick.html Northcode Help Documentation
		*/
		public function sendClick( mouseButton:String = null ):void
		{
			button = compareStrings( mouseButton , button );
			
			switch( button )
			{
				case null:
					missingButton();
					break;
				case LEFT:
				case MIDDLE:
				case RIGHT:
					ssCore.Mouse.sendClick( {button:button}
									  	   ,{callback:actionComplete, errorSTR:"sendClickError", code:"29003"} );
					break;
				default:
					invalidButton();
			}
		}
		private function invalidButton():void
		{
			var e : SendClickEvent = new SendClickEvent( SendClickEvent.INVALID_BUTTON );
			dispatchEvent( e );
		}
	}
}