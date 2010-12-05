package api.popup.getMenu
{
	import api.events.popup.getMenu.GetMenuEvent;

	import api.popup.Popup;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>name</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_NAME
	*/
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.popup.getMenu.GetMenuEvent.RESULT
	*/
	[Event(name="result", type="api.events.popup.getMenu.GetMenuEvent")]
	[Bindable]
	/**
	* Returns a string version of the menu definition that can be saved to a file and restored later using loadFile or setMenu.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_getMenu.html Northcode Help Documentation
	*/
	public class GetMenu extends Popup
	{
		// Required
		/**
		* The name of the current menu to be saved.
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var menu:String = null;
		
		/**
		* Constructor for Popup.GetMenu()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_getMenu.html Northcode Help Documentation
		*/
		public function GetMenu(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Returns a string version of the menu definition that can be saved to a file and restored later using loadFile or setMenu.
		*
		*
		* @param menuName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_getMenu.html Northcode Help Documentation
		*/
		public function getMenu( menuName:String = null ):void
		{
			name = compareStrings( menuName , name );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					ssCore.Popup.getMenu( {name:name}
										 ,{callback:actionComplete, errorSTR:"getMenuError", code:"31002"} );
			}
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			menu = r.result;
			
			var e : GetMenuEvent = new GetMenuEvent( GetMenuEvent.RESULT );
			e.menu = menu;
			dispatchEvent( e );
		}
	}
}