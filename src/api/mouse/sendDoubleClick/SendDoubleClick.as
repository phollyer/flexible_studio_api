package api.mouse.sendDoubleClick
{
	import api.events.mouse.sendDoubleClick.SendDoubleClickEvent;

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
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_sendDoubleClick.html Northcode Help Documentation
	*/
	public class SendDoubleClick extends Mouse
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
		* Constructor for Mouse.SendDoubleClick()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_sendDoubleClick.html Northcode Help Documentation
		*/
		public function SendDoubleClick(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param mouseButton
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_sendDoubleClick.html Northcode Help Documentation
		*/
		public function sendDoubleClick( mouseButton:String = null ):void
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
					ssCore.Mouse.sendDoubleClick( {button:button}
									  	   ,{callback:actionComplete, errorSTR:"sendDoubleClickError", code:"29004"} );
					break;
				default:
					invalidButton();
			}
		}
		private function invalidButton():void
		{
			var e : SendDoubleClickEvent = new SendDoubleClickEvent( SendDoubleClickEvent.RESULT_BUTTON );
			dispatchEvent( e );
		}
	}
}