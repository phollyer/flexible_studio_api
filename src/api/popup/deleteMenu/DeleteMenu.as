package api.popup.deleteMenu
{
	import api.events.popup.deleteMenu.DeleteMenuEvent;

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
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_deleteMenu.html Northcode Help Documentation
	*/
	public class DeleteMenu extends Popup
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		
		/**
		* Constructor for Popup.DeleteMenu()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_deleteMenu.html Northcode Help Documentation
		*/
		public function DeleteMenu(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param menuName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_deleteMenu.html Northcode Help Documentation
		*/
		public function deleteMenu( menuName:String = null ):void
		{
			name = compareStrings( menuName , name );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					ssCore.Popup.deleteMenu( {name:name}
											,{callback:actionComplete, errorSTR:"deleteMenuError", code:"31001"} );
			}
		}
	}
}