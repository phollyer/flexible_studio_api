package api.popup.setMenu
{
	import api.events.popup.setMenu.SetMenuEvent;

	import api.popup.Popup;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>resource</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_RESOURCE
	*/
	[Event(name="missingResource" , type="api.events.SWFStudioEvent")]
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Create a new menu using a menu definition string obtained by a call to Popup.getMenu.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_setMenu.html Northcode Help Documentation
	*/
	public class SetMenu extends Popup
	{
		// Required
		/**
		* A name that you will use to refer to the new menu in all future menu commands.
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		/**
		* The menu definition string.
		*
		* @defaultValue <code>null</code>
		*/
		public var resource:String = null;
		
		/**
		* Constructor for Popup.SetMenu()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_setMenu.html Northcode Help Documentation
		*/
		public function SetMenu(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Create a new menu using a menu definition string obtained by a call to Popup.getMenu.
		*
		*
		* @param menuName
		*
		* @param resourceSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_setMenu.html Northcode Help Documentation
		*/
		public function setMenu( menuName:String = null , resourceSTR:String = null ):void
		{
			name = compareStrings( menuName , name );
			resource = compareStrings( resourceSTR , resource );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					switch( resource )
					{
						case null:
							missingResource();
							break;
						default:
							ssCore.Popup.setMenu( {name:name , resource:resource}
												 ,{callback:actionComplete, errorSTR:"setMenuError", code:"31008"} );
					}
			}
		}

	}
}