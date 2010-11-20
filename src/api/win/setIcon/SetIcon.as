package api.win.setIcon
{
	import api.events.win.setIcon.SetIconEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>resource</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_RESOURCE
	*/
	[Event(name="missingResource" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setIcon.html Northcode Help Documentation
	*/
	public class SetIcon extends Win
	{		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var forceUpdate:Boolean = true;
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var resource:String = null
		
		/**
		* Constructor for Win.SetIcon()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setIcon.html Northcode Help Documentation
		*/
		public function SetIcon(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		*
		*
		*
		* @param iconResource
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setIcon.html Northcode Help Documentation
		*/
		public function setIcon( iconResource:String = null ):void
		{			
			resource = compareStrings( iconResource , resource );
			
			switch( resource )
			{
				case null:
					missingResource();
					break;
				default:
					ssCore.Win.setIcon( {forceUpdate:forceUpdate , resource:resource}
									   ,{callback:actionComplete, errorSTR:"setIconError", code:"6024"} );	
			}
		}
		private function setIconComplete( r:Object , c:Object , e:Object ):void
		{			
			switch( r.success )
			{
				case true:
					var event : SetIconEvent = new SetIconEvent( SetIconEvent.RESULT );
					dispatchEvent( event );
					break;
				case false:
					e.id = "6024";
					dispatchError( WinError.SET_ICON_ERROR , e );
			}
		}
	}
}