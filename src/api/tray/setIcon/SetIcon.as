package api.tray.setIcon
{
	import api.events.tray.setIcon.SetIconEvent;

	import api.tray.Tray;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>resource</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_RESOURCE
	*/
	[Event(name="missingResource" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Change the icon displayed in the system tray.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_setIcon.html Northcode Help Documentation
	*/
	public class SetIcon extends Tray
	{
		// Required
		/**
		* A fully qualified path to an ICO file or the path to a resource in the layout.
		*
		* @defaultValue <code>null</code>
		*/
		public var resource:String = null;
		
		/**
		* Constructor for Tray.SetIcon()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_setIcon.html Northcode Help Documentation
		*/
		public function SetIcon(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Change the icon displayed in the system tray.
		*
		*
		* @param iconResource
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_setIcon.html Northcode Help Documentation
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
					ssCore.Tray.setIcon( {resource:resource}
										,{callback:actionComplete, errorSTR:"setIconError", code:"43003"} );
			}
		}
	}
}