package api.mouse.sendRelease
{
	import api.events.mouse.sendRelease.SendReleaseEvent;

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
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_sendRelease.html Northcode Help Documentation
	*/
	public class SendRelease extends Mouse
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
		* Constructor for Mouse.SendRelease()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_sendRelease.html Northcode Help Documentation
		*/
		public function SendRelease(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param mouseButton
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_sendRelease.html Northcode Help Documentation
		*/
		public function sendRelease( mouseButton:String = null ):void
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
					ssCore.Mouse.sendRelease( {button:button}
									  	   ,{callback:actionComplete, errorSTR:"sendReleaseError", code:"29006"} );
					break;
				default:
					invalidButton();
			}
		}
		private function invalidButton():void
		{
			var e : SendReleaseEvent = new SendReleaseEvent( SendReleaseEvent.RESULT_BUTTON );
			dispatchEvent( e );
		}
	}
}