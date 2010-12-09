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
	* Change the icon display on the title bar while the application is running.
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
		* A fully qualified path to an ICO file or the path to a resource in the layout.
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
		* Change the icon display on the title bar while the application is running.
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
	}
}