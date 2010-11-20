package api.popup.newMenu
{
	import api.events.popup.newMenu.NewMenuEvent;

	import api.popup.Popup;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>name</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_NAME
	*/
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_newMenu.html Northcode Help Documentation
	*/
	public class NewMenu extends Popup
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		
		/**
		* Constructor for Popup.NewMenu()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_newMenu.html Northcode Help Documentation
		*/
		public function NewMenu(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param menuName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_newMenu.html Northcode Help Documentation
		*/
		public function newMenu( menuName:String = null ):void
		{
			name = compareStrings( menuName , name );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					ssCore.Popup.newMenu( {name:name}
										 ,{callback:actionComplete, errorSTR:"newMenuError", code:"31004"} );
			}
		}
	}
}